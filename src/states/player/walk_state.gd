extends "res://src/states/player/movement_state.gd"



@export var idle_state : State

func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("run")

func _on_physics_process(delta: float) -> State:
	var r := super(delta)
	print(r)
	if r != null:
		return r
	if target.input_direction == 0:
		return idle_state
	return null

