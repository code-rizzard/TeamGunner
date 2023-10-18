extends "res://src/mobs/enemies/red/states/base_state.gd"

@export var idle_state : State
var can_shoot := true

func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("attack")

func _on_physics_process(delta : float) -> State:
	var r := super(delta)
	if r != null:
		return r
	var dist : Vector2 = abs(parent.target.global_position - parent.global_position)
	if (dist.y >=32 * 3 and dist.x > 32 * 2) or dist.x >= 5 * 32.5:
		parent.target = null
		return idle_state
	
	if can_shoot and dist.y < 32:
		shoot()
	return null




func shoot():
	parent.shoot()
	can_shoot = false
	await get_tree().create_timer(1).timeout
	can_shoot = true
