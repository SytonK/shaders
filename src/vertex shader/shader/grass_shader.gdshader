shader_type canvas_item;

void vertex() {
	if (VERTEX.y < 0.0) {
		VERTEX.x += (sin(TIME * 1.3) + 1.0) * 300.0;
	}
}