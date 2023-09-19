class_name Transition extends Node

@export var target: State:
	set(val): target = validate_target(val)
@export var recursive = false

@onready var state: State = validate_state()


func validate_state():
	var s: State = get_parent()
	if recursive:
		target = s
		return s
	assert(s != target, "current and target can not be the same state.. (enable is_recursive if this was intended)")
	return s


func validate_target(s: State):
	assert(s, "don't forget to assign a target! target was %s" % s)
	var sm: StateMachine = get_parent().get_parent()
	assert(sm.get_children().has(s), "target state must not go outside this state machine.. target was %s" % s)
	return s


func _transition() -> bool:
	return false
