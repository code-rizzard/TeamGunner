extends "res://src/states/player/movement_state.gd"

@export var idle_state : State


func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("jump")

func _on_physics_process(delta) -> State:
	var r := super(delta)
	if r != null:
		return r
	if parent.is_on_floor():
		return idle_state
	return null