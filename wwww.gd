extends Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Label.text = $StateMachine.active.to_string()
