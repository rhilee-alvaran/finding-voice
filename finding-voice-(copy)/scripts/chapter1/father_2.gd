extends Node3D

@onready var anim = $AnimationPlayer

func play_animation():
	anim.play("FatherAction")
