class_name MyState extends State
# remember to reset the state in either _enter() or _leave() !!!

# called each frame
func _process(delta):
	pass


# called when the state is entered.
func _enter(from) -> void:
	pass # reset the state here


# called when we leave the state
func _leave(to) -> void:
	pass # or here


func _to_string():
	pass
