shader_type canvas_item;

uniform sampler2D noise_pattern;
uniform sampler2D tone_mapping;

uniform vec2 scroll_speed0 = vec2(0.23, 0.28);
uniform vec2 scroll_speed1 = vec2(0.15, 0.17);

uniform float base_intensity: hint_range(0.0, 0.5) = 0.0;
uniform float intencity_factor: hint_range(0.0, 5.0) = 1;

void fragment() {
	float texure_alpha = texture(TEXTURE, UV).a;
	float pattern_intensity0 = texture(noise_pattern, fract(UV + TIME * scroll_speed0)).r;
	float pattern_intensity1 = texture(noise_pattern, fract(UV + TIME * scroll_speed1)).r;
	float pattern_intensity = pattern_intensity0 * pattern_intensity1;
	
	float intensity = (texure_alpha * pattern_intensity + base_intensity) * intencity_factor;
	
	COLOR = texture(tone_mapping, vec2(intensity));
}
