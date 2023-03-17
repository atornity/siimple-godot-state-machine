class_name CancelState extends Transition

var cancel = false

func _input(event):
	if Input.is_action_just_pressed("ui_select"):
		cancel = true

# the transition function,
# return true if we should transition
func _transition() -> bool:
	if cancel:
		cancel = false
		return true
	return false
