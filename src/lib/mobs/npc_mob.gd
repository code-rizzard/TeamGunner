extends MobCharacter
class_name NpcMob

@export var player_detector : RayCast2D

var target : Node2D :
	get: 
		return target if is_instance_valid(target) else null
	


func try_detect_target():
	if sign(player_detector.target_position.x) != look_direction:
		player_detector.target_position.x *= -1
	if player_detector.is_colliding() and target == null:
		target = player_detector.get_collider()
			
		