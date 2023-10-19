extends CharacterBody2D
class_name MobCharacter


signal on_die

@export var max_health := 100
@export var movement_speed = 100.0
@export var jump_height := 2.0
@export var attack_cd := 0.5
@export_flags_2d_physics var attack_mask := 1
@export var hurtbox : Hurtbox
@export var anim_player : AnimatedSprite2D
@export var muzzle : Marker2D

var look_direction : 
	get: return -1 if anim_player.flip_h else 1

@onready var health := max_health

var gravity: int =  ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead := false


func _ready():
	hurtbox.on_hit.connect(_on_hurtbox_hit)

func _on_hurtbox_hit(damage : DamageInfo):
	health -= damage.damage
	if health <= 0:
		die()

func die():
	is_dead = true
	on_die.emit()
	