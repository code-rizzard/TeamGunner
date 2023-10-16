@tool
extends Camera2D

@export var target : Node2D

func _physics_process(_delta: float) -> void:
	if target != null:
		global_position = target.global_position
