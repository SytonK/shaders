shader_type canvas_item;

uniform sampler2D noise_pattern;
uniform sampler2D tone_mapping;

void fragment() {
	float texure_alpha = texture(TEXTURE, UV).a;
	float pattern_intensity = texture(noise_pattern, UV).r;
	float intensity = texure_alpha * pattern_intensity;
	
	COLOR = texture(tone_mapping, vec2(intensity));
}
