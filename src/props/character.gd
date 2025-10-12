class_name Character
extends CharacterBody2D

## Left (-1) to Right (1)
var _horizontal_direction: int

## Up to Down
var _vertical_velocity: float

@export var weapon: Weapon
@export var stats: Stats

@onready var state: State = State.new(stats)
@onready var visuals: Node2D = %Visuals

var damage_effect: CPUParticles2D

func apply_damage(source: Character, amount: int) -> void:
	state.health -= amount

	print("%s took %d damage from %s, health is now %d" % [self, amount, source, state.health])

	add_child(Create.text_float("-" + str(amount), Color.RED))

	if state.health <= 0:
		queue_free()
		return

func _process(delta: float) -> void:
	if not is_on_floor():
		_vertical_velocity += ProjectSettings.get_setting("physics/2d/default_gravity") * delta
	velocity = Vector2(_horizontal_direction * stats.move_speed, _vertical_velocity)

func _physics_process(_delta: float) -> void:
	move_and_slide()

func move_left():
	_horizontal_direction = -1
	visuals.scale.x = -1
func move_right():
	_horizontal_direction = 1
	visuals.scale.x = 1
func stop_moving():
	_horizontal_direction = 0

func execute_jump():
	if is_on_floor():
		_vertical_velocity = - stats.jump_strength
