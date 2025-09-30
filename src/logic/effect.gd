@abstract
class_name Effect
extends Resource

func validate(hit_info: HitInfo, context: ActionContext) -> bool:
	if hit_info.target and context.source:
		if hit_info.target != context.source:
			return true
		push_warning("Effect cannot target the source character itself.")
		return false

	push_warning("Effect validation failed: Missing target or source.")
	return false

@abstract
func resolve(hit_info: HitInfo, context: ActionContext) -> void
