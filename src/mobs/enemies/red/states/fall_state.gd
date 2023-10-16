extends "res://src/mobs/enemies/red/states/move_state.gd"

@export var idle_state : State

func _on_physics_process(delta) -> State:
	var r := super(delta)
	if r != null:
		return r
	if parent.is_on_floor():
		return idle_state
	return null
