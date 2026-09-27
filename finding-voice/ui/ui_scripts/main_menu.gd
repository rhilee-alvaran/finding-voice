extends Control



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/chapter1/chap_1_001_wake_up.tscn")



func _on_quit_pressed() -> void:
	get_tree().quit()
