extends Node3D

var opened = false
@export var target_scene : PackedScene


func open():
	if $AnimationPlayer.current_animation != "open":
		if !opened:
			$AnimationPlayer.play("open")
		if opened:
			$AnimationPlayer.play_backwards("open")
		opened = !opened

func open_teleport(player_camera : Camera3D):
	var tween = get_tree().create_tween()
	tween.tween_property(player_camera, "fov", 175.0, 0.2 )
	tween.tween_callback(teleport).set_delay(0.12)
	if $AnimationPlayer.current_animation != "open":
		if !opened:
			$AnimationPlayer.play("open")
		if opened:
			$AnimationPlayer.play_backwards("open")
		opened = !opened
func teleport():
	if target_scene:
		get_tree().change_scene_to_packed(target_scene)
	else:
		print("Scene file not found")
	


#func open_teleport():
	#if $AnimationPlayer.current_animation != "open":
		#if !opened:
			#$AnimationPlayer.play("open")
		#if opened:
			#$AnimationPlayer.play_backwards("open")
		#opened = !opened
	#var path = "res://scenes/%s.tscn" % scene
	##verify if path exists
	#if ResourceLoader.exists(path):
		#get_tree().change_scene_to_file(path)
	#else:
		#push_error("Scene file not found: " + path)
