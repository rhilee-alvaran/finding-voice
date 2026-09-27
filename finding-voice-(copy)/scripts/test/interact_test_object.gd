extends Node3D

@export var ground:MeshInstance3D
@export var player : Node3D
@export var target_scene : PackedScene
@onready var player_camera = player.get_node("head/Camera3D")

func tween_color():
	var tween = get_tree().create_tween()
	tween.tween_property(ground, "material_override:albedo_color", Color.RED , 1.0)
	tween.tween_property(ground, "scale", Vector3.ZERO, 1.0)
func tween_camera():
	var tween = get_tree().create_tween()
	tween.tween_property(player_camera, "fov", 179.0, 0.2 )
func teleport():
	if target_scene:
		get_tree().change_scene_to_packed(target_scene)
	else:
		print("Scene file not found")
	
