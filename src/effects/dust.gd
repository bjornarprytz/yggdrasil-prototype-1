class_name Dust
extends CPUParticles2D

const emission_fat: float = 0

const grace := 1.0

func setup_left(size: Vector2):
	emission_rect_extents = Vector2(emission_fat, size.y * grace / 2)
	position = Vector2(size.x * (1 - grace), size.y / 2)
	direction = Vector2.LEFT
	_scale_to_magnitude(size.y, size.x)

func setup_right(size: Vector2):
	emission_rect_extents = Vector2(emission_fat, size.y * grace / 2)
	position = Vector2(size.x * grace, size.y / 2)
	direction = Vector2.RIGHT
	_scale_to_magnitude(size.y, size.x)

func setup_up(size: Vector2):
	emission_rect_extents = Vector2(size.x * grace / 2, emission_fat)
	position = Vector2(size.x / 2, size.y * (1 - grace))
	direction = Vector2.UP
	_scale_to_magnitude(size.x, size.y)

func setup_down(size: Vector2):
	emission_rect_extents = Vector2(size.x * grace / 2, emission_fat)
	position = Vector2(size.x / 2, size.y * grace)
	direction = Vector2.DOWN
	_scale_to_magnitude(size.x, size.y)

func trigger():
	emitting = true
	finished.connect(queue_free)

func _scale_to_magnitude(high: float, _low: float):
	scale_amount_min = high / 100.0
	scale_amount_max = high / 50.0
