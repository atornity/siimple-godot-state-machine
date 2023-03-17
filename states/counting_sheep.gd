class_name CountingSheep extends State

var sheep_counted: int = 0
var been_here: bool = false

func _process(delta):
	if delta > randf_range(0, 1):
		sheep_counted += 1
		print("%d sheep!" % sheep_counted)


# called when the state is entered
func _enter(from):
	if from is CountingSheep:
		print(".. where was I again?")
		return
	if been_here:
		print("oh well.. back to counting..")
	else: 
		print("I guess I could count some sheep??")
		been_here = true


# called when we leave the state
func _leave(to):
	if to is CountingSheep:
		print("quit it! I'm trying to count!")
	sheep_counted = 0 # reset any relevant data when we leave (if we don't we will have issues)


func _to_string():
	return "counting sheep"

