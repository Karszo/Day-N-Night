extends CharacterBody2D

var speed: int  = 100
var direction: Vector2 = Globals.playerPos

var health: int = 100
var dmg: int = 25

func _ready():
	$despawn.start()

func _process(delta):
	
	if Globals.night:
		dmg = 50
		speed = 125
	else:
		dmg = 25
		speed = 100
	
	direction = (Globals.playerPos - position).normalized()
	
	position += direction  * delta * speed
	velocity = Vector2.ZERO
	look_at(Globals.playerPos)
	move_and_slide()
	
	
	if health <= 0:
		queue_free()
		Globals.score += 1

func hit():
	health -= 50




func _on_area_2d_body_entered(body):
	if "hit" in body:
		body.hit(dmg)


func _on_despawn_timeout():
	queue_free()
