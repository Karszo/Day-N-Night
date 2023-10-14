extends Area2D

func free():
	$Timer.start()

func _process(delta):
	if body_shape_entered():
		Globals.playerHealth = 100
