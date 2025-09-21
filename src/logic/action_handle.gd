class_name ActionHandle
extends Node

var context: ActionContext

func _init(action: Action) -> void:
	context = ActionContext.new()
	context.action = action


func resolve_action_sequence(animation: ActionAnimation, weapon: Weapon, hit_callback: Callable) -> void:
	var handle_hit = hit_callback.bind(context)
	await animation.do_windup(weapon)
	weapon.on_hit.connect(handle_hit)
	await animation.do_active_phase(weapon)
	weapon.on_hit.disconnect(handle_hit)
	await animation.do_winddown(weapon)
