extends RefCounted
class_name DamageInfo


var damage := 0
var damager : Node2D

func _init(_damage : int, _damager : Node2D) -> void:
    self.damage = _damage
    self.damager = _damager
