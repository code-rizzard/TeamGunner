extends Hitbox


@export var speed := 1000.0
var direction := Vector2.RIGHT
var source : Node2D

func setup(dir : Vector2, pos: Vector2, attack_mask : int, _source : Node2D):
	global_position = pos
	direction = dir
	collision_mask = attack_mask | collision_mask
	source = _source

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta
	

func _on_area_entered(area:Area2D) -> void:
	if area is Hurtbox:
		var a := area as Hurtbox

		a.hit(DamageInfo.new(10, source if is_instance_valid(source) else null))
		queue_free()


func _on_body_entered(_body:Node2D) -> void:
	queue_free()
