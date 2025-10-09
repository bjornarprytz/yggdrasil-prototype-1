class_name Player
extends Character

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack_primary"):
		execute_primary_attack()
	if event.is_action_pressed("attack_secondary"):
		execute_secondary_attack()
	if event.is_action_pressed("special"):
		execute_special()
	if event.is_action_pressed("trinket"):
		execute_trinket_effect()
	if event.is_action_pressed("jump"):
		execute_jump()

func _process(delta: float) -> void:
	super._process(delta)
	horizontal_velocity = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")

func execute_primary_attack():
	weapon.primary_attack.resolve(self)

func execute_secondary_attack():
	weapon.secondary_attack.resolve(self)

func execute_special():
	weapon.special_effect.resolve(self)

func execute_jump():
	if is_on_floor():
		vertical_velocity = - stats.jump_strength

func move(direction: float):
	horizontal_velocity = direction

func execute_trinket_effect():
	push_warning("Trinkets not implemented yet")
	pass

func _to_string() -> String:
	return "Player"
