class_name Hitbox
extends Area2D

## The object that the hitbox represents
@export var prop: Node


func _ready() -> void:
	assert(prop != null, "prop required on hitbox")
