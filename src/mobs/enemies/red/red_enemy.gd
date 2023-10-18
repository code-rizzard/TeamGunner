extends CharacterBody2D

@export var max_health := 100
@export var movement_speed = 100.0
@export_flags_2d_physics var attack_mask := 1
@export var player_detector : RayCast2D
@export var hurtbox : Hurtbox
@export var anim_player : AnimatedSprite2D
@export var muzzle : Marker2D


var target : Node2D :
	get: 
		return target if is_instance_valid(target) else null

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
@onready var space := get_world_2d().direct_space_state
var gravity: int =  ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	hurtbox.on_hit.connect(on_hurtbox_hit)
	

func shoot():
	muzzle.shoot(-1 if anim_player.flip_h else 1)


func on_hurtbox_hit(damage : DamageInfo):
	health -= damage.damage
	if health <= 0:
		queue_free()

func _physics_process(_delta: float) -> void:
	try_detect_target()


func try_detect_target():
	if sign(player_detector.target_position.x) != look_direction:
		player_detector.target_position.x *= -1
	if player_detector.is_colliding() and target == null:
		target = player_detector.get_collider()
	



