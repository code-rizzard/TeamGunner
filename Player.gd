extends CharacterBody2D

@export var max_health := 100
@export var movement_speed = 100.0
@export var hurtbox : Hurtbox
const JUMP_VELOCITY = -400.0



@onready var health := max_health
var gravity: int =  ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	hurtbox.on_hit.connect(on_hurtbox_hit)

	while true:
		await get_tree().create_timer(1).timeout
		hurtbox.hit(50)
		



func on_hurtbox_hit(damage : int):
	health -= damage
	if health <= 0:
		queue_free()



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = lerpf(velocity.x, direction * movement_speed, 0.5)

	move_and_slide()
