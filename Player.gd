extends CharacterBody2D


@export var movement_speed = 100.0
const JUMP_VELOCITY = -400.0

var gravity: int =  ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	print(velocity.x)
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = lerpf(velocity.x, direction * movement_speed, 0.5)

	move_and_slide()
