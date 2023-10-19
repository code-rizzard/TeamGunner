extends NpcMob



@onready var space := get_world_2d().direct_space_state



	

func shoot():
	muzzle.shoot(-1 if anim_player.flip_h else 1)




func _physics_process(_delta: float) -> void:
	try_detect_target()





