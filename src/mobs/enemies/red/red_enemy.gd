extends CharacterBody2D

@export var max_health := 100
@export var movement_speed = 100.0
@export var hurtbox : Hurtbox
@export var anim_player : AnimatedSprite2D
@export var muzzle : Marker2D

var look_direction : 
	get: return -1 if anim_player.flip_h else 1

const muzzle_positions := {
	"idle": Vector2(9,-3),
	"walk": Vector2(9,-3),
	"jump": Vector2(10,-3),
	"fall": Vector2(10,-3),
	"crouch": Vector2(10,1),
}

@onready var health := max_health
var gravity: int =  ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	hurtbox.on_hit.connect(on_hurtbox_hit)
	

func shoot():
	muzzle.shoot(-1 if anim_player.flip_h else 1)


func on_hurtbox_hit(damage : int):
	health -= damage
	if health <= 0:
		queue_free()


	



