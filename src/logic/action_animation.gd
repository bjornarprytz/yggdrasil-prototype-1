class_name ActionSequence
extends Node

var id: String

## TODO: Maybe replace the sequences with animation data

func do_windup(node: Node):
	var tween = node.create_tween()
	tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(node, "rotation_degrees", -12, 0.1).as_relative()
	await tween.finished

func do_active_phase(node: Node):
	var tween = node.create_tween()
	tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(node, "rotation_degrees", 270, 0.1).as_relative()
	await tween.finished

func do_winddown(node: Node):
	var tween = node.create_tween()
	tween.set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(node, "rotation_degrees", 0, 0.1)
	await tween.finished
