extends "res://src/mobs/enemies/red/states/base_state.gd"


@export var walk_state : State
@export var shoot_state : State
@export var fall_state : State

func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("idle")



func _on_physics_process(_delta) -> State :
	var r := super(_delta)
	if r != null:
		return r

	target.velocity.x = lerpf(target.velocity.x, 0, 0.7)
	if not parent.is_on_floor() and parent.velocity.y > 0:
		return fall_state
	
	return walk_state


func _on_after_physics_process(delta : float) -> State:
	parent.move_and_slide()
	return super(delta)
