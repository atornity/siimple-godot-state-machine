class_name State extends Node

@onready var transitions: Array[Transition] = get_transitions()


func get_transitions() -> Array[Transition]:
	var children: Array[Transition]
	for c in get_children():
		assert(c is Transition, "all children must be transitions")
		children.push_back(c)
	return children

## called when transitioning to this state
func _enter(_from) -> void:
	pass

## called before transitioning from this state
func _leave(_to) -> void:
	pass
