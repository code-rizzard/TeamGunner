extends "res://src/states/player/base_state.gd"

@export var jump_state : State






func _on_process(_delta) -> State:
	var r := super(_delta)
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump_state
	return r

func _on_physics_process(_delta) -> State :
	var r := super(_delta)
	target.velocity.x = lerpf(target.velocity.x, target.input_direction * target.movement_speed, 0.7)
	parent.move_and_slide()
	return r





