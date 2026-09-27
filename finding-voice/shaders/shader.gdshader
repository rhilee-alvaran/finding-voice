shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D depth_texture : hint_depth_texture, hint_default_black;

// Adjust this value to make the lines thicker or thinner
uniform float outline_thickness : hint_range(1.0, 5.0, 1.0) = 1.0;

void fragment() {
	vec2 uv = SCREEN_UV;
	vec2 size = SCREEN_PIXEL_SIZE * outline_thickness;
	
	// Sample the depth buffer at the current pixel center
	float depth_center = texture(depth_texture, uv).r;
	
	// Sample four neighboring pixels around the center
	float depth_left   = texture(depth_texture, uv + vec2(-size.x, 0.0)).r;
	float depth_right  = texture(depth_texture, uv + vec2(size.x, 0.0)).r;
	float depth_top    = texture(depth_texture, uv + vec2(0.0, -size.y)).r;
	float depth_bottom = texture(depth_texture, uv + vec2(0.0, size.y)).r;
	
	// Edge detection using the Sobel/Laplacian filter on depth changes
	float edge = abs(depth_center - depth_left) + 
	             abs(depth_center - depth_right) + 
	             abs(depth_center - depth_top) + 
	             abs(depth_center - depth_bottom);
	
	// Clean up and threshold the edge values
	float edge_mask = step(0.0005, edge);
	
	// Base everything to pure black, and edges to pure white
	vec3 base_black = vec3(0.0, 0.0, 0.0);
	vec3 outline_white = vec3(1.0, 1.0, 1.0);
	
	COLOR.rgb = mix(base_black, outline_white, edge_mask);
}