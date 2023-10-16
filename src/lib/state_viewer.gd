extends Node2D
class_name StateViewer

@export var text_label : Label
var state_machine : StateMachine

@onready var orig_offset : Vector2


func _ready():
    orig_offset = position
    if text_label == null:
        text_label = Label.new()
        add_child(text_label)

    state_machine = get_parent()
    assert(state_machine != null && state_machine is StateMachine, "StateViewer must be a child of a StateMachine")

func _physics_process(_delta: float) -> void:
    global_position = state_machine.target.global_position + orig_offset
    text_label.text = state_machine.current_state.name




