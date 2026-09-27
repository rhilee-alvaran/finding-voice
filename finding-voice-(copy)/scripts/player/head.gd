extends Node3D

@export var sensitivity = 0.002
@export var controller_sensitivity = 2

func _physics_process(delta: float) -> void:
	# 1. Get the joystick input vector (-1 to 1 range)
	var joy_dir: Vector2 = Input.get_vector("look_left", "look_right", "look_up", "look_down")
	
	# 2. If the stick is being moved, apply the rotation
	if joy_dir != Vector2.ZERO:
		# Rotate the player/body horizontally (Y-axis)
		rotate_y(-joy_dir.x * controller_sensitivity * delta)
		
		# Rotate the camera vertically (X-axis)
		$Camera3D.rotate_x(-joy_dir.y * controller_sensitivity * delta)
		
		# Clamp the vertical rotation using your existing min/max limits
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("esc"):
		#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	#if Input.is_action_just_pressed("left_mouse"):
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		get_parent().rotate_y(-event.relative.x * sensitivity)
		rotate_x(-event.relative.y * sensitivity)
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(42))
