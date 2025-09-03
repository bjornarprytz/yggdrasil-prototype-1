class_name Character
extends Node2D

var weapon: Weapon
var trinket: Trinket
var relics: Array[Relic] = []


func _process(_delta: float) -> void:
    pass

func execute_primary_attack():
    pass

func execute_secondary_attack():
    pass

func execute_special():
    pass

func execute_jump():
    pass

func move(_direction: Vector2):
    pass

func execute_trinket_effect():
    if trinket:
        trinket.effect.apply(self)
    pass
