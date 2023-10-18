extends State

@export var shoot_state : State
@onready var parent : CharacterBody2D

func _on_ready():
	super()
	parent = target


func _on_physics_process(delta: float) -> State:
	var r = super(delta)
	if r != null:
		return r
	
	if not parent.is_on_floor():
		parent.velocity.y += parent.gravity * delta
	if parent.target != null:
		return shoot_state
	return null
