shader_type canvas_item;

uniform sampler2D noise_pattern;
uniform sampler2D tone_mapping;
uniform float base_intensity: hint_range(0.0, 0.5) = 0.0;

void fragment() {
	float texure_alpha = texture(TEXTURE, UV).a;
	float pattern_intensity = texture(noise_pattern, UV).r;
	float intensity = texure_alpha * pattern_intensity + base_intensity;
	
	COLOR = texture(tone_mapping, vec2(intensity));
}
