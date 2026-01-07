extends Node2D


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://encounter.tscn"))


func _on_start_button_mouse_entered() -> void:
	pass # Replace with function body.


func _on_start_button_mouse_exited() -> void:
	pass # Replace with function body.
