class_name StateMachine extends Node


enum ProcessMode { PROCESS, PHYSICS_PROCESS, NONE }

@export var state_owner: Node
@export var transitions_process_mode = ProcessMode.PROCESS
@export var max_transitions: int = 4
@export var warn_reached_max: bool = true

@onready var active: State = get_child(0)


func _ready():
	if !state_owner:
		state_owner = get_parent()
	
	for state in get_children():
		state.owner = state_owner
		if state != active:
			for trans in state.transitions:
				trans.set_process(false)
			state.set_process(false)
			
	active._enter(null)


func _process(_delta):
	if transitions_process_mode == ProcessMode.PROCESS:
		for i in max_transitions:
			if !try_transition(): break


func _physics_process(_delta):
	if transitions_process_mode == ProcessMode.PHYSICS_PROCESS:
		for i in max_transitions:
			if !try_transition(): break


func process_transitions():
	for i in max_transitions:
		if !try_transition(): return
	if warn_reached_max:
		push_warning("max transitions reached! (you may have forgotten to reset your state somewhere)")

func try_transition() -> bool:
	for trans in active.transitions:
		if trans._transition():
			change_state(trans.target)
			return true
	return false


func change_state(new_state: State):
	active._leave(new_state)
	active.set_process(false)
	for trans in active.transitions:
		trans.set_process(false)
	
	new_state.set_process(true)
	new_state._enter(active)
	for trans in new_state.transitions:
		trans.set_process(true)
	
	active = new_state
