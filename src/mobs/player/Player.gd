extends CharacterBody2D
class_name Player

@export var max_health := 100
@export var movement_speed = 100.0
@export var jump_height := 2.0
@export var hurtbox : Hurtbox
@export var anim_player : AnimatedSprite2D
@export var muzzle : Marker2D

var look_direction : 
	get: return -1 if anim_player.flip_h else 1

const muzzle_positions := {
	"idle": Vector2(16,-3),
	"walk": Vector2(16,-3),
	"jump": Vector2(17,-3),
	"fall": Vector2(17,-3),
	"crouch": Vector2(17,1),
}

var jump_velocity:
	get: return sqrt(2*gravity*jump_height * 32)



@onready var health := max_health
var gravity: int =  ProjectSettings.get_setting("physics/2d/default_gravity")


var input_direction : float


func _ready():
	hurtbox.on_hit.connect(on_hurtbox_hit)
	

func _input(_event):
	if Input.is_action_just_pressed("shoot"):
		shoot()	

func shoot():
	muzzle.shoot(-1 if anim_player.flip_h else 1)


func on_hurtbox_hit(damage : int):
	health -= damage
	if health <= 0:
		queue_free()


	



