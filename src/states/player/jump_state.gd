extends "res://src/states/player/movement_state.gd"



func _on_enter() -> void:
	super()
	self.parent.anim_player.play("jump")
	parent.velocity.y = -parent.jump_velocity


