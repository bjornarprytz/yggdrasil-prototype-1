class_name Player
extends Character

@export var trinket: Trinket
@export var relics: Array[Relic] = []


func _ready() -> void:
	weapon = Weapon.new()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("attack_primary"):
		execute_primary_attack()
	elif event.is_action_pressed("attack_secondary"):
		execute_secondary_attack()
	elif event.is_action_pressed("special"):
		execute_special()
	elif event.is_action_pressed("jump"):
		execute_jump()
	elif event.is_action_pressed("trinket"):
		execute_trinket_effect()

func _process(_delta: float) -> void:
	pass

func execute_primary_attack():
	weapon.primary_attack.resolve(self)

func execute_secondary_attack():
	weapon.secondary_attack.resolve(self)

func execute_special():
	weapon.special_effect.resolve(self)

func execute_jump():
	pass

func move(_direction: Vector2):
	pass

func execute_trinket_effect():
	if trinket:
		trinket.effect.resolve(self)
	pass
