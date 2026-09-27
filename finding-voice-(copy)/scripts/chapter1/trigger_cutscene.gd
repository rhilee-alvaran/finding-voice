extends Area3D

@export var camera : Camera3D
@onready var player = get_tree().get_first_node_in_group("player")
@onready var player_camera = player.get_node("head/Camera3D")
@onready var father = $"../Father2"
@onready var mother = $"../mother2"
@onready var crosshair = get_parent().get_node("player/player_ui/CanvasLayer/CenterContainer/crosshair")
@onready var search = get_parent().get_node("player/player_ui/dot_crosshair/Control/search")
@onready var player_crosshair = get_tree().get_first_node_in_group("player").get_node("head/RayCast3D")
@onready var timer = $Timer
@export var chair : Node3D


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		
		timer.start()
		
		player_crosshair.process_mode = Node.PROCESS_MODE_DISABLED
		if player:
			crosshair.visible = false
			search.visible = false
			var cutscene_ui = player.get_node("player_ui/cutscene_ui")
			camera.current = true
			cutscene_ui.cutscene()
			chair.visible = false
		father.visible = true
		mother.visible = true
		father.play_animation()
		mother.play_animation()
		#ENABLE THE PROCESS MODE OF PLAYER CROSSHAIR AGAIN
		
		monitoring = false #stops

		


func _on_timer_timeout() -> void:
	var cutscene_ui = player.get_node("player_ui/cutscene_ui")
	cutscene_ui.cutscene_out()
	player_crosshair.process_mode = Node.PROCESS_MODE_ALWAYS
	player_camera.current = true
	crosshair.visible = true
	search.visible = true
	father.visible = false
	mother.visible = false
	chair.visible = true
	
	
