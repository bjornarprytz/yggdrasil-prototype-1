class_name State
extends Resource

## TODO: Set based on initial state

func _init(stats: Stats) -> void:
	health = stats.max_health

var health: int = 100
