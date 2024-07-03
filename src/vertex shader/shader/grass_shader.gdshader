shader_type canvas_item;

void vertex() {
	if (VERTEX.y < 0.0) {
		VERTEX += vec2(sin(TIME * 1.3) * 300.0, 0);
	}
}