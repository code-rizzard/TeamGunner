class_name Hitbox
extends Area2D

signal on_hitbox_hit(hurtbox: Hurtbox)



func _ready():
    area_entered.connect(_on_area_entered )

func _on_area_entered(area : Area2D):
    if not area is Hurtbox:
        return
    on_hitbox_hit.emit(area)
