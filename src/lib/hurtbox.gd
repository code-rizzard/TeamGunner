class_name Hurtbox
extends Area2D

signal on_hit(damage : int)



func hit(damage : int):
    on_hit.emit(damage)


