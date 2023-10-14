extends CharacterBody2D
class_name Player

@export var max_health := 100
@export var movement_speed = 100.0
@export var hurtbox : Hurtbox
@export var anim_player : AnimatedSprite2D
const JUMP_VELOCITY = -400.0



@onready var health := max_health
var gravity: int =  ProjectSettings.get_setting("physics/2d/default_gravity")


var input_direction : float


func _ready():
	hurtbox.on_hit.connect(on_hurtbox_hit)
	

		



func on_hurtbox_hit(damage : int):
	health -= damage
	if health <= 0:
		queue_free()

func _process(_delta):
	input_direction = Input.get_axis("move_left", "move_right")
	if input_direction != 0:
		anim_player.flip_h = true if input_direction == -1 else false
	


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


