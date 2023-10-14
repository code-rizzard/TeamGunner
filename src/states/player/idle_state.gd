extends "res://src/states/player/movement_state.gd"

@export var walk_state : State


func _on_physics_process(delta: float) -> State:
	var r := super(delta)
	if r != null:
		return r
	if target.input_direction != 0:
		return walk_state
	self.parent.velocity.x = lerpf(self.parent.velocity.x, 0, 0.5)
	return null


