extends RayCast3D

@onready var crosshair = $player_ui/CanvasLayer/CenterContainer/crosshair

func _ready() -> void:
	crosshair.visible = false
	
func _process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		
		if hit.name == "poop":
			if Input.is_action_just_pressed("interact"):
				hit.get_parent().explode()
				crosshair.visible = true
		if hit.name == "door":
			if Input.is_action_just_pressed("interact"):
				hit.get_parent().get_parent().get_parent().open()
				crosshair.visible = true
	else:
		crosshair.visible = false
