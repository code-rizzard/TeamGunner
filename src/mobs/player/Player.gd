extends MobCharacter
class_name Player




const muzzle_positions := {
	"idle": Vector2(9,-3),
	"walk": Vector2(9,-3),
	"jump": Vector2(10,-3),
	"fall": Vector2(10,-3),
	"crouch": Vector2(10,1),
}

var jump_velocity:
	get: return sqrt(2*gravity*jump_height * 32)



var input_direction : float


func _ready():
	hurtbox.on_hit.connect(on_hurtbox_hit)
	

func _input(_event):
	if Input.is_action_just_pressed("shoot"):
		shoot()	

func shoot():
	muzzle.shoot(-1 if anim_player.flip_h else 1)


func on_hurtbox_hit(damage : DamageInfo):
	health -= damage.damage
	if health <= 0:
		queue_free()


	



