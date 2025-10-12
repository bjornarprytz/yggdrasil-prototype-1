class_name Factory
extends Node2D

# Add factory methods for common scenes here. Access through the Create singleton

var text_float_factory: PackedScene = preload("res://props/text_float.tscn")


func text_float(target: Node2D, text: String, color: Color) -> TextFloat:
	var instance = text_float_factory.instantiate() as TextFloat

	instance.text = text
	instance.color = color
	instance.global_position = target.global_position
	
	get_tree().root.add_child(instance)

	return instance
