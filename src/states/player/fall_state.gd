extends "res://src/states/player/movement_state.gd"

@export var idle_state : State
var can_coyote := false
var has_pressed_jump := false

func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("jump")
	if prev_state == jump_state:
		return
	can_coyote = true
	await get_tree().create_timer(0.1).timeout
	can_coyote = false

func _on_unhandled_input(e : InputEvent) -> State:
	var r = super(e)
	if r != null:
		return r
	if e.is_action_pressed("jump"):
		if can_coyote:
			can_coyote = false
			return jump_state
		start_jump_buffer()
	return null
	
func start_jump_buffer():
	has_pressed_jump = true
	await get_tree().create_timer(0.15).timeout
	has_pressed_jump = false

func _on_physics_process(delta) -> State:
	var r := super(delta)
	if r != null:
		return r
	if parent.is_on_floor():
		if has_pressed_jump:
			has_pressed_jump = false
			return jump_state
		return idle_state
	return null