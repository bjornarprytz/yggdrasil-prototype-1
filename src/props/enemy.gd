class_name Enemy
extends Character

@export var target: Character

func _process(delta: float) -> void:
	super._process(delta)
	if (is_on_floor()):
		execute_jump()
	if target:
		if target.global_position.x > global_position.x:
			horizontal_velocity = 1
		else:
			horizontal_velocity = -1
	else:
		horizontal_velocity = 0

func _to_string() -> String:
	return "Enemy"
