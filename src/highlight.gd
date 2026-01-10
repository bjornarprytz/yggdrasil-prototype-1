class_name Highlight
extends CPUParticles2D

@onready var parent : Control = get_parent()

func _ready() -> void:
	assert(parent != null and parent is Control )
	emitting = false
	
	parent.mouse_entered.connect(_start)
	parent.mouse_exited.connect(_end)
	
	parent.resized.connect(_resize)
	_resize()

func _resize():
	emission_rect_extents = parent.size / 2
	position = parent.size / 2

func _start():
	emitting = true

func _end():
	emitting = false
