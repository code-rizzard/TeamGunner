extends "res://src/states/player/base_state.gd"


var is_called := false

func _on_enter(new : State) -> void:
	super(new)
	parent.velocity.x = 0
	if not parent.is_on_floor():
		return
	die()

func die():
	is_called = true
	parent.anim_player.play("death")
	parent.hurtbox.set_deferred("monitorable", false)
	await parent.anim_player.animation_finished
	parent.queue_free()

func _on_physics_process(delta : float) -> State:
	var r := super(delta)
	if r != null:
		return r
	if not is_called and parent.is_on_floor():
		die()
	
	parent.velocity.y += parent.gravity * delta
	parent.move_and_slide()
	return null
