extends NpcMob


const muzzle_positions := {
	"idle": Vector2(9,-3),
	"walk": Vector2(9,-3),
	"jump": Vector2(10,-3),
	"fall": Vector2(10,-3),
	"crouch": Vector2(10,1),
}

@onready var space := get_world_2d().direct_space_state



	

func shoot():
	muzzle.shoot(-1 if anim_player.flip_h else 1)




func _physics_process(_delta: float) -> void:
	try_detect_target()





