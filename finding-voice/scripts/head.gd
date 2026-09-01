extends Node3D

@export var sensitivity = 0.002

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
