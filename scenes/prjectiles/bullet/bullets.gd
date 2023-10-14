extends Area2D

@export var speed: int  = 1000
var direction: Vector2 = Vector2.UP


func _ready():
	$despawn.start()

func _process(delta):
	position += speed * delta * direction



func _on_despawn_timeout():
	queue_free()




func _on_body_entered(body):
	queue_free()
	if "hit" in body:
		body.hit()
	
