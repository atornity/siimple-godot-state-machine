class_name ToCounting extends Transition


# the transition function,
# return true if we should transition
func _transition() -> bool:
	var s = state as Sleeping
	return s.sleep_time >= 2

