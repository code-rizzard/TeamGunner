extends State

var parent : Player

func _on_ready():
	super()
	parent = self.target

func _on_physics_process(_delta) -> State :
	var r := super(_delta)
	parent.move_and_slide()
	return r





