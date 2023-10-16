extends State

var parent : Player


func _on_ready():
	super()
	parent = self.target

func _on_enter(_s : State) -> void:
	parent.muzzle.position = parent.muzzle_positions[name.to_lower().trim_suffix("state")]


func _on_process(delta) -> State:
	var r := super(delta)
	parent.input_direction = Input.get_axis("move_left", "move_right")
	if parent.input_direction != 0:
		parent.anim_player.flip_h = true if parent.input_direction == -1 else false
	return r


func _on_physics_process(delta: float) -> State:
	if not parent.is_on_floor():
		parent.velocity.y += parent.gravity * delta
	return super(delta)


func _on_after_physics_process(_delta: float) -> State:
	return super(_delta)
	
