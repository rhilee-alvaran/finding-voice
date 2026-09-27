extends CanvasLayer

@onready var top_block = $top_block
@onready var bottom_block = $bottom_block

func cutscene():
	var tween = create_tween().set_parallel(true)
	
	tween.tween_property(top_block, "position", Vector2(0, -250), 2)
	tween.tween_property(bottom_block, "position", Vector2(0, 600), 2)

func cutscene_out():
	var tween = create_tween().set_parallel(true)
	
	tween.tween_property(top_block, "position", Vector2(0, -500), 1.5)
	tween.tween_property(bottom_block, "position", Vector2(0, 850), 1.5)
