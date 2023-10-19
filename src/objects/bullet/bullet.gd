extends Hitbox


@export var tile_distance_travel := 6.0
var direction := Vector2.RIGHT
var source : Node2D

var velocity := Vector2.ZERO
var is_dead := false

func setup(dir : Vector2, pos: Vector2, attack_mask : int, _source : Node2D):
	global_position = pos
	direction = dir
	collision_mask = attack_mask | collision_mask
	source = _source


	#Kinematic equations
	const horizontal_distance_from_muzzle := 17
	var time_to_y = sqrt((horizontal_distance_from_muzzle * 2) / gravity)
	var d := 32 * tile_distance_travel
	var vel_for_x =	(d -  (gravity * time_to_y * time_to_y) / 2.0 )/time_to_y
	velocity.x = vel_for_x * direction.x

func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	global_position += velocity * delta
	rotation = velocity.angle()

	

func _on_area_entered(area:Area2D) -> void:
	if area is Hurtbox and not is_dead:
		var a := area as Hurtbox

		a.hit(DamageInfo.new(10, source if is_instance_valid(source) else null))
		is_dead = true
		queue_free()


func _on_body_entered(_body:Node2D) -> void:
	is_dead = true
	queue_free()
