class_name TextFloat
extends Node2D

@export var text: String
@export var color: Color = Color.WHITE
@onready var label: RichTextLabel = %Label

static func create(_text: String, _color: Color) -> TextFloat:
	var instance = TextFloat.new()
	instance.text = _text
	instance.color = _color

	return instance

func _ready() -> void:
	label.clear()
	label.push_color(color)
	label.append_text(text)
	label.pop()
	
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position:y", -20, .69).as_relative()
	tween.tween_callback(queue_free)
