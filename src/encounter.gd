class_name Encounter
extends Node2D

@onready var enemy: Enemy = $Enemy


func _ready() -> void:
	enemy.tree_exited.connect(_encounter_over)
	
func _encounter_over():
	get_tree().change_scene_to_file("res://pick_power.tscn")
