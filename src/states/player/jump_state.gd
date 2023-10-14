extends "res://src/states/player/movement_state.gd"

@export var idle_state : State

func _on_enter() -> void:
	super()
	self.parent.anim_player.play("jump")
	parent.velocity.y = parent.JUMP_VELOCITY

func _on_physics_process(delta) -> State:
	var r := super(delta)
	parent.velocity.x = lerpf(target.velocity.x, target.input_direction * target.movement_speed, 0.7)
	if parent.is_on_floor():
		return idle_state
	return r

