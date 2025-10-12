class_name Action
extends Resource

var sequence: ActionSequence = ActionSequence.new()
var effects: Array[Effect] = [DamageEffect.new(3, 7)]
var cooldown: float = 0.0

## TODO: Implement cooldown

func _on_hit(hit_info: HitInfo, action: ActionHandle) -> void:
	for effect in effects:
		if effect.validate(hit_info, action):
			effect.resolve(hit_info, action)

func resolve(source: Character) -> void:
	var handle = ActionHandle.new(self, source)
	source.get_tree().root.add_child(handle)
	handle.resolve_action_sequence(_on_hit)
