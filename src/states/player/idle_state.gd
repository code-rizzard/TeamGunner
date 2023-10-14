extends "res://src/states/player/movement_state.gd"

@export var walk_state : State



func _on_enter() -> void:
	super()
	self.parent.anim_player.play("idle")


func _on_physics_process(delta: float) -> State:
	var r := super(delta)
	if r != null:
		return r
	if target.input_direction != 0:
		return walk_state
	return null


