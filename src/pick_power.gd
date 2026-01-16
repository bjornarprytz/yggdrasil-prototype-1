extends Node2D


@onready var cards: HBoxContainer = %Cards
@onready var background: ColorRect = %Background


func _ready() -> void:
	for card in cards.get_children():
		card.picked.connect(_handle_picked.bind(card), CONNECT_ONE_SHOT)


func _handle_picked(item_card: ItemCard):
	for card in cards.get_children():
		if card != item_card:
			card.process_mode = Node.PROCESS_MODE_DISABLED
	
	var tween = create_tween()
	
	tween.tween_property(background, "modulate", Color.BLACK, 3.2)
	
	await tween.finished
	
	get_tree().change_scene_to_file("res://main.tscn")
	
