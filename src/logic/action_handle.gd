class_name ActionHandle
extends Node

var action: Action
var source: Character

func _init(_action: Action, _source: Character) -> void:
	action = _action
	source = _source


func resolve_action_sequence(hit_callback: Callable) -> void:
	var handle_hit = hit_callback.bind(self)
	await action.sequence.do_windup(source.weapon)
	var current_hit = source.weapon.check_hitbox()
	if current_hit:
		handle_hit.call(current_hit)
	source.weapon.on_hit.connect(handle_hit)
	await action.sequence.do_active_phase(source.weapon)
	source.weapon.on_hit.disconnect(handle_hit)
	await action.sequence.do_winddown(source.weapon)
