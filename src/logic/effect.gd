class_name Effect
extends Resource

func validate(hit_info: HitInfo, action: ActionHandle) -> bool:
	if hit_info.target and action.source:
		if hit_info.target != action.source:
			return true
		push_warning("Effect cannot target the source character itself.")
		return false

	push_warning("Effect validation failed: Missing target or source.")
	return false

func resolve(hit_info: HitInfo, action: ActionHandle) -> void:
	pass
