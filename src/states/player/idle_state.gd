extends "res://src/states/player/base_state.gd"

@export var walk_state : State
@export var jump_state : State
@export var crouch_state : State
@export var fall_state : State


func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("idle")



func _on_process(_delta) -> State:
	var r := super(_delta)
	if Input.is_action_just_pressed("jump") and parent.is_on_floor():
		return jump_state
	if Input.is_action_pressed("crouch") and parent.is_on_floor():
		return crouch_state
	return r

func _on_physics_process(_delta) -> State :
	var r := super(_delta)
	if r != null:
		return r

	target.velocity.x = lerpf(target.velocity.x, 0, 0.7)
	if not parent.is_on_floor() and parent.velocity.y > 0:
		return fall_state
	if parent.input_direction != 0:
		return walk_state
	
	return null


func _on_after_physics_process(delta : float) -> State:
	parent.move_and_slide()
	return super(delta)
