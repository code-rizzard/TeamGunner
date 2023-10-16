extends "res://src/states/player/base_state.gd"


@export var idle_state : State
@export var jump_state : State

var prev_input : float = 0

func _on_enter() -> void:
	super()
	parent.anim_player.play("crouch")


func _on_process(delta) -> State:
	var r := super(delta)
	if r != null:
		return r
	if Input.is_action_just_released("crouch"):
		return idle_state
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump_state
	return null


func _on_physics_process(delta) -> State:
	var r := super(delta)
	if r != null:
		return r
	parent.velocity.x = 0
	return null


func _on_after_physics_process(delta : float) -> State:
	parent.move_and_slide()
	return super(delta)
