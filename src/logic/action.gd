class_name Action
extends Resource

var animation: ActionAnimation = ActionAnimation.new()
var effects: Array[Effect] = []
var cooldown: float

# Add action logic here

func _on_hit(hit_info: HitInfo, context: ActionContext) -> void:
	for effect in effects:
		effect.resolve(hit_info, context)

func resolve(source: Character) -> void:
	var handle = ActionHandle.new(self)
	source.get_tree().root.add_child(handle)
	handle.resolve_action_sequence(animation, source.weapon, _on_hit)
