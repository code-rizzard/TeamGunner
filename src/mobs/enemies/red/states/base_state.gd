extends State

@export var shoot_state : State
@onready var parent : CharacterBody2D

func _on_ready():
	super()
	parent = target

	parent.hurtbox.on_hit.connect(on_hurtbox_hit)
	
func on_hurtbox_hit(_damage : DamageInfo) -> void:
	if not is_active():
		return
	if parent.target == null:
		parent.target = _damage.damager


func _on_physics_process(delta: float) -> State:
	var r = super(delta)
	if r != null:
		return r
	
	if not parent.is_on_floor():
		parent.velocity.y += parent.gravity * delta
	if parent.target != null:
		var x = sign(parent.target.global_position.x - parent.global_position.x)
		if x != parent.look_direction:
			parent.anim_player.flip_h = !parent.anim_player.flip_h
		return shoot_state
	return null
