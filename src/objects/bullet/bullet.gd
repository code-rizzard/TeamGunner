extends Hitbox


@export var speed := 1000.0
var direction := Vector2.RIGHT

func setup(dir : Vector2, pos: Vector2):
	global_position = pos
	direction = dir

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta
	

func _on_area_entered(area:Area2D) -> void:
	if area is Hurtbox:
		var a := area as Hurtbox
		a.hit(10)
		queue_free()


func _on_body_entered(_body:Node2D) -> void:
	queue_free()