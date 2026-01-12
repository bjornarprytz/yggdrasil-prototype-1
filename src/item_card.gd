class_name ItemCard
extends PanelContainer

@onready var texture: TextureRect = %Texture
@onready var info: TextBox = %Info

var effect_active = false

func _on_mouse_entered() -> void:
	if (effect_active):
		return
	effect_active = true
	
	await NodeEffects.sheen(self).finished
	
	effect_active = false

func _on_mouse_exited() -> void:
	pass # Replace with function body.
