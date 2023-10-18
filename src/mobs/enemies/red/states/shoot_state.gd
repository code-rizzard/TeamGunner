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
	var dist : Vector2 = parent.target.global_position - parent.global_position
	if abs(dist.y) >=32 or abs(dist.x) >= 5 * 32.5:
		parent.target = null
		return idle_state
	
	if can_shoot and abs(dist.y) < 32:
		shoot()
	return null




func shoot():
	parent.shoot()
	can_shoot = false
	await get_tree().create_timer(0.25).timeout
	can_shoot = true
