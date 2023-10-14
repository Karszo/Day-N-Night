extends CanvasLayer


func _ready():
	$AudioStreamPlayer2D.play(0)
func _process(_delta):
	pass

func _on_button_pressed():
	
	TransitionLayer.change_scean("res://scenes/levels/level.tscn")
	


func _on_button_2_pressed():
	get_tree().quit()


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play(0)
