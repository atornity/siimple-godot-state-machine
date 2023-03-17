class_name Sleeping extends State


var sleep_time: float = 0

func _process(delta):
	sleep_time += delta

# called when the state is entered
func _enter(from):
	print("Zzz..")

# called when we leave the state
func _leave(to):
	print("!!! oh no! I woke up !!!")
	sleep_time = 0


func _to_string():
	return "sleeping"
