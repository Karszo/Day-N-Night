extends CanvasLayer

signal newGame()
signal leave()

func _ready():
	$MarginContainer3/VBoxContainer/HBoxContainer/Label2.text = str(Globals.score)
	
func _process(_delta):
	
	if $MarginContainer3/VBoxContainer/Button.button_pressed:
		newGame.emit()
	if $MarginContainer3/VBoxContainer/Button2.button_pressed:
		leave.emit()


func _on_leave():
	get_tree().quit()


func _on_new_game():
	Globals.score = 0
	Globals.reset = true
	TransitionLayer.change_scean("res://scenes/levels/level.tscn")
