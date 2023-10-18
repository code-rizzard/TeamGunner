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
		if c is State:
			c._init_state(target, self)
	current_state._on_enter(null)

func _change_state(new_state : State):
	if new_state == null or new_state == current_state:
		return 
	current_state._on_exit(new_state)
	var prev = current_state
	current_state = new_state
	new_state._on_enter(prev)


func _unhandled_input(event: InputEvent) -> void:
	if current_state == null:
		return
	_change_state(current_state._on_unhandled_input(event))
	

	
func _process(delta):
	if current_state == null:
		return
	_change_state(current_state._on_process(delta))
	


func _physics_process(delta):
	if current_state == null:
		return
	_change_state(current_state._on_physics_process(delta))

	## After physics process
	_change_state(current_state._on_after_physics_process(delta))

