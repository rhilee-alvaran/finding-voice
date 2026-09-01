extends Node3D

var opened = false

func open():
	if $AnimationPlayer.current_animation != "open":
		if !opened:
			$AnimationPlayer.play("open")
		if opened:
			$AnimationPlayer.play_backwards("open")
		opened = !opened
