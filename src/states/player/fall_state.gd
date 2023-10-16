extends "res://src/states/player/movement_state.gd"

@export var idle_state : State
var can_coyote := false

func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("jump")
	prints("FALL", prev_state.name, prev_state == jump_state)
	if prev_state == jump_state:
		return
	can_coyote = true
	await get_tree().create_timer(0.1).timeout
	can_coyote = false

func _on_unhandled_input(e : InputEvent) -> State:
	var r = super(e)
	if r != null:
		return r
	if e.is_action("jump") and can_coyote:
		can_coyote = false
		return jump_state
	return null
	

func _on_physics_process(delta) -> State:
	var r := super(delta)
	if r != null:
		return r
	if parent.is_on_floor():
		return idle_state
	return null