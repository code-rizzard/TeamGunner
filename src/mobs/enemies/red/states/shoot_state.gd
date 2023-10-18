extends "res://src/mobs/enemies/red/states/base_state.gd"

@export var idle_state : State
var can_shoot := true

var too_far_timer : SceneTreeTimer
var happened_timer := 6.0

func  _on_enter(prev_state : State) -> void:
	super(prev_state)
	self.parent.anim_player.play("attack")

func _on_exit(new : State) -> void:
	super(new)
	too_far_timer = null
	happened_timer = 6

func _on_physics_process(delta : float) -> State:
	happened_timer -= delta
	var r := super(delta)
	print(happened_timer)
	if r != null:
		return r
	if parent.target == null:
		return idle_state
	var dist : Vector2 = abs(parent.target.global_position - parent.global_position)
	
	if dist.x >= 5.5 * 32:
		parent.target = null
		return idle_state
	

	if (dist.y >=32 * 3 or dist.x > 32 * 2) :
	
		if too_far_timer == null:
			too_far_timer = get_tree().create_timer(1.5)
		elif too_far_timer.time_left == 0:
			if (dist.y >=32 * 2 and dist.x > 32 * 2) :
				parent.target = null
				return idle_state
			too_far_timer = null
		


	if can_shoot and dist.y < 32:
		shoot()
	if happened_timer <= 0:
		parent.target = null
		return idle_state
	return null


func shoot():
	happened_timer = 6
	parent.shoot()
	can_shoot = false
	await get_tree().create_timer(1).timeout
	can_shoot = true
