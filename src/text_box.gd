@tool
class_name TextBox
extends PanelContainer

@onready var text_label: RichTextLabel = %TextLabel

@export var text: String:
	set(val):
		text = val
		_update_text()
		

func _update_text():
	if (!is_node_ready()):
		return
	text_label.text = text
