class_name ItemCard
extends Button

var move_tween: Tween

func _on_mouse_entered() -> void:
	_move_to(Vector2(-1, -1))
	Audio.play(preload("res://assets/sound/stone-scrape.wav"))

func _on_mouse_exited() -> void:
	_move_to(Vector2.ZERO)

func _on_button_down() -> void:
	_move_to(Vector2(10,10))
	move_tween.tween_callback(_boom)
	pass

func _on_button_up() -> void:
	#_move_to(Vector2.ZERO)
	pass

func _on_pressed() -> void:
	if (move_tween != null and move_tween.is_running()):
		await move_tween.finished
	_move_to(Vector2.ZERO)

func _move_to(pos: Vector2):
	if (move_tween != null):
		move_tween.kill()
	
	move_tween = NodeEffects.move_to(self, pos, .1)

func _boom() -> void:
	NodeEffects.dust(self)
	Audio.play(preload("res://assets/sound/rock-impact.mp3"))
