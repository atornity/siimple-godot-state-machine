class_name MyTransition extends Transition


# the transition function,
# return true if we should transition
func _transition() -> bool:
	return (state as CountingSheep).sheep_counted >= 10

