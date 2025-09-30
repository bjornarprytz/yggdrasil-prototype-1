class_name DamageEffect
extends Effect

var min_damage: int = 1
var max_damage: int = 1

func _init(_min_damage: int = 1, _max_damage: int = 1) -> void:
    min_damage = _min_damage
    max_damage = _max_damage


func resolve(hit_info: HitInfo, context: ActionContext) -> void:
    hit_info.target.apply_damage(context.source, randi_range(min_damage, max_damage))
