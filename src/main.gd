extends Node2D

@onready var start_button: Button = %StartButton

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://encounter.tscn"))

func _on_start_button_mouse_entered() -> void:
	NodeEffects.sheen(start_button)
	Audio.play(preload("res://assets/sound/sword-schwing-40520.mp3"))


func _on_start_button_mouse_exited() -> void:
	pass # Replace with function body.
