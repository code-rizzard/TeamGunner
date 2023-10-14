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


	



