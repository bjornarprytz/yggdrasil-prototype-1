extends Node2D

func jiggle(node: CanvasItem, n_jiggles: int = 3, magnitude: float = 10.0, speed: float = 10.0) -> Tween:
	var tween = node.create_tween()

	var duration = (1.0 / speed)
	
	tween.tween_property(node, "rotation_degrees", magnitude / 2, duration / 2).as_relative()

	var dir_sign = -1
	for i in range(n_jiggles - 1):
		tween.tween_property(node, "rotation_degrees", dir_sign * magnitude, duration).as_relative()
		dir_sign = - dir_sign
	
	tween.tween_property(node, "rotation_degrees", dir_sign * magnitude / 2, duration / 2).as_relative()

	return tween

func shake(node: CanvasItem, n_shakes: int = 5, magnitude: float = 10.0, speed: float = 30.0) -> Tween:
	var tween = node.create_tween()
	var duration = (1.0 / speed)
	var original_position = node.position
	var offset = Vector2(randf_range(-magnitude, magnitude), randf_range(-magnitude, magnitude))

	for i in range(n_shakes):
		tween.tween_property(node, "position", offset, duration).as_relative()
		offset = (-offset.rotated(randf_range(-PI / 2, PI / 2))).normalized() * magnitude
	
	tween.tween_property(node, "position", original_position, duration)

	return tween

func sheen(node: CanvasItem, duration: float = 0.5) -> Tween:
	var effect = Create.sheen()
	node.add_child(effect)
	var tween = effect.play(duration)
	return tween
