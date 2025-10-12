class_name Enemy
extends Character

@export var target: Character

func _process(delta: float) -> void:
	super._process(delta)
	if (is_on_floor()):
		execute_jump()
	_move()

func _move():
	if target:
		if target.global_position.x > global_position.x:
			move_right()
		else:
			move_left()
	else:
		stop_moving()

func _to_string() -> String:
	return "Enemy"
