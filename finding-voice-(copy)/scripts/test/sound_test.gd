extends Node3D

@onready var audio_player = $AudioStreamPlayer3D
@onready var speaker = $MeshInstance3D

func play_sound():
	audio_player.play()

	var mat = speaker.get_active_material(0) as StandardMaterial3D
	
	if mat:
		mat.albedo_color = Color.GREEN
	
