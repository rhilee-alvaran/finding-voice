extends Control

func _ready() -> void:
	$pause_menu.visible = false

func resume_game():
	get_tree().paused = false
	$pause_menu.visible = false

func quit_game():
	get_tree().quit()
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):
		PROCESS_MODE_ALWAYS
		$pause_menu.visible = !$pause_menu.visible
		get_tree().paused = $pause_menu.visible
		if get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif !get_tree().paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
