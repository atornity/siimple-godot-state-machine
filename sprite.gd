extends Sprite2D

@onready var state_machine: StateMachine = $StateMachine

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = state_machine.active.to_string()
