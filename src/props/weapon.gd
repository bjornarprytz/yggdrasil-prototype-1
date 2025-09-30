class_name Weapon
extends Node2D

@export
var id: String

var primary_attack: Action = Action.new()
var secondary_attack: Action = Action.new()
var special_effect: Action = Action.new()

@onready var my_hitbox: Hitbox = $Hitbox

signal on_hit(hit_info: HitInfo)

func _on_hitbox_area_entered(area: Area2D) -> void:
	if (area is Hitbox and area.prop is Character):
		print("Weapon hit %s" % area.prop)
		var hit_info = HitInfo.new(area.prop)
		on_hit.emit(hit_info)
