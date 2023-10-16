extends "res://src/states/player/movement_state.gd"



func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("jump")
	parent.velocity.y = -parent.jump_velocity
	if not Input.is_action_pressed("jump"):
		parent.velocity.y = -100

func _on_unhandled_input(e : InputEvent) -> State:
	var r := super(e)
	if r != null:
		return r
	if e.is_action_released("jump"):
		parent.velocity.y = max(-100, parent.velocity.y)
		return fall_state
	return null



