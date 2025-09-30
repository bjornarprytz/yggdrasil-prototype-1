class_name ActionContext
extends Resource

var action: Action
var source: Character
var weapon: Weapon

func _init(_action: Action, _source: Character):
    action = _action
    source = _source
    weapon = _source.weapon

