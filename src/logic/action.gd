class_name Action
extends Resource

var sequence: ActionSequence = ActionSequence.new()
var effects: Array[Effect] = [DamageEffect.new(2, 4)]
var cooldown: float = 0.0

## TODO: Implement cooldown

func _on_hit(hit_info: HitInfo, context: ActionContext) -> void:
	for effect in effects:
		if effect.validate(hit_info, context):
			effect.resolve(hit_info, context)

func resolve(source: Character) -> void:
	var handle = ActionHandle.new(self, source)
	source.get_tree().root.add_child(handle)
	handle.resolve_action_sequence(_on_hit)
