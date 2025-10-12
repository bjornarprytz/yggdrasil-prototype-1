class_name Weapon
extends Node2D

@export
var id: String

var primary_attack: Action = Action.new()
var secondary_attack: Action = Action.new()
var special_effect: Action = Action.new()

@onready var my_hitbox: Hitbox = $Hitbox

signal on_hit(hit_info: HitInfo)

func check_hitbox() -> HitInfo:
	for area in  my_hitbox.get_overlapping_areas():
		var hit_info = _area_to_hit_info(area)
		
		if hit_info:
			return hit_info
	return null

func _on_hitbox_area_entered(area: Area2D) -> void:
	var hit_info = _area_to_hit_info(area)
	
	if hit_info:
		on_hit.emit(hit_info)

func _area_to_hit_info(area: Area2D) -> HitInfo:
	if (area is Hitbox and area.prop is Character):
		var hit_info = HitInfo.new(area.prop)
		return hit_info
	
	return null
