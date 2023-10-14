extends Node
class_name StateMachine

@export var target : Node
@export var initial_state : State

var current_state : State
var prev_state : State = null





func _ready():
	if target == null:
		target = get_parent()
	assert(target !=null, "StateMachine needs to have a target.")
	if initial_state == null:
		for c in get_children():
			if c is State :
				initial_state = c
	assert(initial_state != null, "No initial state found.")
	current_state = initial_state

	for c in get_children():
		c._init_state(target)



func _process(delta):
	if current_state == null:
		return
	var new_state = current_state._on_process(delta)
	if new_state != null:
		current_state._on_exit()
		current_state = new_state
		new_state._on_enter()


func _physics_process(delta):
	if current_state == null:
		return
	var new_state = current_state._on_physics_process(delta)
	if new_state != null:
		current_state._on_exit()
		current_state = new_state
		new_state._on_enter()

