class_name Hurtbox
extends Area2D

signal on_hit(damage : DamageInfo)



func hit(damage : DamageInfo):
    on_hit.emit(damage)


