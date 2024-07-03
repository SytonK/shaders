shader_type canvas_item;

uniform vec3 replace_color: source_color;

void fragment() {
	vec3 color_without_green = COLOR.rgb * vec3(1, 0, 0);
	float amount_of_red_and_blue = length(color_without_green);
	float red_and_blue_mask = step(0.01, amount_of_red_and_blue);
	
	vec3 retained_color = COLOR.rgb * red_and_blue_mask;
	
	
	float green_mask = (1.0 - red_and_blue_mask) * COLOR.g;
	
	vec3 masked_replacment_color = replace_color * green_mask;
	
	
	vec3 final_color = retained_color + masked_replacment_color;
	COLOR.rgb = vec3(final_color);
}
