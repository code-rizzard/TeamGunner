extends CharacterBody2D
class_name MobCharacter

@export var max_health := 100
@export var movement_speed = 100.0
@export var jump_height := 2.0
@export_flags_2d_physics var attack_mask := 1
@export var hurtbox : Hurtbox
@export var anim_player : AnimatedSprite2D
@export var muzzle : Marker2D


var look_direction : 
	get: return -1 if anim_player.flip_h else 1

@onready var health := max_health
var gravity: int =  ProjectSettings.get_setting("physics/2d/default_gravity")
