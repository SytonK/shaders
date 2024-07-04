shader_type canvas_item;

uniform float strength: hint_range(0, 8) = 0;

vec4 blur_size(sampler2D tex,vec2 frag_coord, vec2 pixel_size, float blur_strength) {
    
    vec4 color = vec4(0.);

    vec2 pixel = frag_coord/pixel_size;
    int x_min = max(int(pixel.x-blur_strength), 0);
    int x_max = min(int(pixel.x+blur_strength), int(1./pixel_size.x));
    int y_min = max(int(pixel.y-blur_strength), 0);
    int y_max = min(int(pixel.y+blur_strength), int(1./pixel_size.y));

    int count =0;

    // Sum the pixels colors
    for(int x=x_min; x <= x_max; x++) {
        for(int y = y_min; y <= y_max; y++) {           
            color += texture(tex, vec2(float(x), float(y)) * pixel_size);
            count++;
        }
    }
    
    // Divide the color by the number of colors you summed up
    color /= float(count);
    
    return color;
}

void fragment() {
    COLOR = blur_size(TEXTURE,UV,TEXTURE_PIXEL_SIZE, strength);
}