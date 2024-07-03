extends Sprite2D


func _on_color_picker_color_changed(color: Color) -> void:
	print("set shader color")
	material.set_shader_parameter("ReplacementColor", color)
