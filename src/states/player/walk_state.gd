extends "res://src/states/player/movement_state.gd"



@export var idle_state : State

func _on_physics_process(delta: float) -> State:
	var r := super(delta)
	if r != null:
		return r
	if target.input_direction == 0:
		return idle_state
	target.velocity.x = lerpf(target.velocity.x, target.input_direction * target.movement_speed, 0.7)
	return null

