extends "res://src/mobs/enemies/red/states/base_state.gd"


@export var wander_state : State
@export var fall_state : State

var stay_on_idle := false




func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("idle")
	if prev_state == wander_state:
		stay_on_idle = true
		await get_tree().create_timer(1).timeout
		parent.anim_player.flip_h = !parent.anim_player.flip_h
		stay_on_idle = false




func _on_physics_process(_delta) -> State :
	var r := super(_delta)
	if r != null:
		return r

	target.velocity.x = lerpf(target.velocity.x, 0, 0.7)
	if not parent.is_on_floor() and parent.velocity.y > 0:
		return fall_state
	if stay_on_idle:
		return null
	return wander_state


func _on_after_physics_process(delta : float) -> State:
	parent.move_and_slide()
	return super(delta)
