extends RayCast3D

var in_cutscene := false
@onready var crosshair = get_parent().get_parent().get_node("player_ui/CanvasLayer/CenterContainer/crosshair")
@onready var search = get_parent().get_parent().get_node("player_ui/dot_crosshair/Control/search")

func _ready() -> void:
	crosshair.visible = true
	search.visible = false
	
func _process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		
		if hit.name == "test":
			search.visible = true
			crosshair.visible = false
			if Input.is_action_just_pressed("interact"):
				hit.get_parent().get_parent().tween_camera()
				hit.get_parent().get_parent().teleport()
				#hit.get_parent().get_parent().tween_color()
		if hit.name == "sound":
			search.visible = true
			crosshair.visible = false
			if Input.is_action_just_pressed("interact"):
				hit.get_parent().get_parent().play_sound()
		
		#if hit.name == "poop":
			#search.visible = false
			#if Input.is_action_just_pressed("interact"):
				#hit.get_parent().explode()
		#if hit.name == "door":
			#search.visible = false
			#if Input.is_action_just_pressed("interact"):
				#hit.get_parent().get_parent().get_parent().open()
		#if hit.name == "doorteleport":
			#search.visible = false
			#if Input.is_action_just_pressed("interact"):
				#var player_camera = get_parent().get_node("Camera3D") as Camera3D
				#hit.get_parent().get_parent().get_parent().open_teleport(player_camera)
	else:
		crosshair.visible = true
		search.visible = false
