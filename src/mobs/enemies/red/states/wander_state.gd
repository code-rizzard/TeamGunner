extends "res://src/mobs/enemies/red/states/move_state.gd"



@export var idle_state : State

var space : PhysicsDirectSpaceState2D


func _on_ready() -> void:
	super()
	space = parent.get_world_2d().direct_space_state


func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("walk")

func detect_wall() -> bool:
	var query = PhysicsRayQueryParameters2D.create(parent.global_position, parent.global_position + Vector2.RIGHT * 32 * parent.look_direction, 4294967295, [parent.get_rid()])
	var hit  = space.intersect_ray(query)
	return hit.is_empty()


func _on_physics_process(delta: float) -> State:
	var r := super(delta)
	if r != null:
		return r
	
	if not detect_wall():
		parent.anim_player.flip_h = !parent.anim_player.flip_h
	return null

