class_name Character
extends CharacterBody2D

## Left (-1) to Right (1)
var horizontal_velocity: float
## Up (-1) to Down (1)
var vertical_velocity: float

@export var weapon: Weapon
@export var state: State = State.new()
@export var stats: Stats = Stats.new()

var damage_effect: CPUParticles2D

func apply_damage(source: Character, amount: int) -> void:
	state.health -= amount

	print("%s took %d damage from %s, health is now %d" % [self, amount, source, state.health])

	add_child(Create.text_float("-" + str(amount), Color.RED))

func _process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		vertical_velocity += ProjectSettings.get_setting("physics/2d/default_gravity") * delta
	else:
		vertical_velocity = 0

func _physics_process(_delta: float) -> void:
	velocity = Vector2(horizontal_velocity * stats.move_speed, vertical_velocity)

	move_and_slide()
