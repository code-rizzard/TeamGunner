class_name State
extends Node

var target : Node


## This is called when the state is ready after parent is initialized. Initialize variables here that are dependent on the state machine.
func _on_ready() -> void:
	pass


## This is a private method initializing default behavior of a State
func _init_state(_t: Node) -> void:
	target = _t
	set_process(false)
	set_physics_process(false)
	_on_ready()

## Called when a state enters
func _on_enter() -> void:
	pass

## Called when a state exits
func _on_exit() -> void:
	pass

## Equivalent to _process when state is active
func _on_process(_delta : float) -> State:
	return null

## Equivalent to _physics_process when state is active
func _on_physics_process(_delta: float) -> State:
	return null

## Called after the _on_physics_process is finished when state is active
func _on_after_physics_process(_delta: float) -> State:
	return null
	