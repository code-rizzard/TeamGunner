extends "res://src/states/player/movement_state.gd"


var was_crouched := false
func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("jump")
	parent.velocity.y = -parent.jump_velocity
	if prev_state == crouch_state:
		was_crouched = true
		parent.velocity.y = -sqrt(2*parent.gravity*(parent.jump_height + 0.65) * 32)

	if not Input.is_action_pressed("jump"):
		parent.velocity.y = -100

func _on_exit(new : State) -> void:
	super(new)
	was_crouched = false

func _on_unhandled_input(e : InputEvent) -> State:
	var r := super(e)
	if r != null:
		return r
	if e.is_action_released("jump"):
		parent.velocity.y = max(-100, parent.velocity.y)
		return fall_state
	return null


func _on_physics_process(delta) -> State:
	var r := super(delta)
	if r != null:
		return r
	if was_crouched:
		parent.velocity.x *= 1.15
	return null



