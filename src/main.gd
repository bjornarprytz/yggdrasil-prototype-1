extends Node2D

@onready var start_button: Button = %StartButton

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://encounter.tscn"))

func _on_start_button_mouse_entered() -> void:
	NodeEffects.sheen(start_button)


func _on_start_button_mouse_exited() -> void:
	pass # Replace with function body.
