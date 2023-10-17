extends "res://src/mobs/enemies/red/states/move_state.gd"



@export var idle_state : State

func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("walk")


func _on_physics_process(delta: float) -> State:
	var r := super(delta)
	if r != null:
		return r
	var space = parent.get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(parent.global_position, parent.global_position + Vector2.RIGHT * 32 * parent.look_direction, 4294967295, [parent.get_rid()])
	var hit  = space.intersect_ray(query)
	if not hit.is_empty():
		parent.anim_player.flip_h = !parent.anim_player.flip_h
	return null

