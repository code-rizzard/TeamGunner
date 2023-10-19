extends MobCharacter
class_name NpcMob

@export var player_detector : RayCast2D

var target : MobCharacter :
	get: 
		return target 
	set(v):
		if target != null:
			target.on_die.disconnect(_on_target_die)
		target = v
		if target != null:
			target.on_die.connect(_on_target_die)
	
func _on_target_die():
	target = null

func try_detect_target():
	if sign(player_detector.target_position.x) != look_direction:
		player_detector.target_position.x *= -1
	if player_detector.is_colliding() and target == null:
		target = player_detector.get_collider()
			
		
