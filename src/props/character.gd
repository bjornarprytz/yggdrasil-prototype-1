class_name Character
extends Node2D

@export var weapon: Weapon
@export var state: State = State.new()

func apply_damage(source: Character, amount: int) -> void:
	state.health -= amount

	print("%s took %d damage from %s, health is now %d" % [self, amount, source, state.health])
