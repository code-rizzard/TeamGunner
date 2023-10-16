extends "res://src/states/player/movement_state.gd"



func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("jump")
	parent.velocity.y = -parent.jump_velocity
	if prev_state == crouch_state:
		parent.velocity.y = -sqrt(2*parent.gravity*(parent.jump_height + 0.6) * 32)


