class_name Character
extends Node2D

@export var weapon: Weapon
@export var stats: Stats


func take_damage(amount: int):
	var text = preload("res://content/damage_float.tscn").instantiate() as RichTextLabel
	text.bbcode_text = "[color=red]%d[/color]" % amount
	add_child(text)
	var tween = create_tween().set_parallel()
	text.position = Vector2(0, 0)
	tween.tween_property(text, "position", Vector2(0, -25), 1.69).as_relative()
	tween.tween_property(text, "modulate:a", 0, 1.69)
	await tween.finished
	text.queue_free()
