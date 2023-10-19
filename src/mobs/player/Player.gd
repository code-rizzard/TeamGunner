extends MobCharacter
class_name Player


@export var max_ammo := 50

@onready var current_ammo := max_ammo

var can_shoot := true
const muzzle_positions := {
	"idle": Vector2(9,-3),
	"walk": Vector2(9,-3),
	"jump": Vector2(10,-3),
	"fall": Vector2(10,-3),
	"crouch": Vector2(10,1),
	"death": Vector2(10,1),
}

var jump_velocity:
	get: return sqrt(2*gravity*jump_height * 32)



var input_direction : float



func _input(_event):
	if not is_dead and Input.is_action_just_pressed("shoot") and can_shoot and current_ammo >0:
		shoot()	

func shoot():
	can_shoot = false
	muzzle.shoot(-1 if anim_player.flip_h else 1)
	current_ammo -= 1
	await get_tree().create_timer(attack_cd).timeout
	can_shoot = true



	



