shader_type spatial;
render_mode unshaded;

instance uniform vec3 color: source_color = vec3(1, 1, 1);

void fragment() {
	ALBEDO = color;
}
