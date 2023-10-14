extends CanvasLayer

var tween: Tween
@onready var temp :int = $MarginContainer/TextureProgressBar.value
var night: bool = false 

func _ready():
	$day.start()
	$day/AudioStreamPlayer2D.play(0)



func _process(_delta):
	if night:
		$MarginContainer/TextureProgressBar.value = $night.time_left*2
		Globals.timeDay = $night.time_left*2
	else:
		$MarginContainer/TextureProgressBar.value = $day.time_left
		Globals.timeDay = $day.time_left
	$MarginContainer4/HBoxContainer/Label2.text = str(Globals.score)
	Globals.night = night
	
	$MarginContainer2/TextureProgressBar.value = Globals.playerHealth





func _on_day_timeout():
	$night.start()
	night = true
	$night/AudioStreamPlayer2D.play(0)
	$day/AudioStreamPlayer2D.stop()


func _on_night_timeout():
	$day.start()
	night = false
	$day/AudioStreamPlayer2D.play(0)
	$night/AudioStreamPlayer2D.stop()
	
