extends Marker2D

@export var bullet_scene : PackedScene

@onready var parent := get_parent() as Node2D

func shoot(dir : int):
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	var pos := position
	pos.x *= dir
	b.setup(Vector2.RIGHT * dir, parent.global_position + pos)
