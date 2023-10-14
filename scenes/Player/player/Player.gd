extends CharacterBody2D

var shootPoint: Array 
var slectedPoint


var playerDirection
var direction

const speed: int = 200
var canShoot: bool = true
var playerHealth: int = 100

signal shoot(pos,direction)
signal zombie(pos,direction)

var maxSpawn: int = 20

func _ready():
	$"zombie spawns".start()

func _process(_delta):
	
	
	
	look_at(get_global_mouse_position())
	Globals.playerPos = position
	
	
	Globals.playerHealth = playerHealth
	
	direction = Input.get_vector("left","right","up","dpwn")
	velocity = direction * speed
	move_and_slide()
	
	
	
	
	if Globals.night:
		maxSpawn = 30
	else:
		maxSpawn = 20
	
	playerDirection = (get_global_mouse_position() - position).normalized()
	
	if(Input.is_action_just_pressed("shoot") and canShoot):
		canShoot = false
		$shootTimer.start()
		
		shootPoint = $shootingPoints.get_children()
		slectedPoint = shootPoint[randi() % shootPoint.size()]
		$AnimatedSprite2D.visible = true
		$AnimatedSprite2D.play("default",1.0,true)
		
		shoot.emit(slectedPoint.global_position, playerDirection)
	


func hit(dmg):
	
	var tween = get_tree().create_tween()
	set_collision_layer_value(1,false)
	$"I fram".start()
	playerHealth -= dmg
	for x in 5:
		tween.tween_property($player,"visible",false,.25)
		tween.tween_property($player,"visible",true,.25)
	


func _on_shoot_timer_timeout():
	canShoot = true


func _on_animated_sprite_2d_animation_finished():
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.visible = false





func _on_zombie_spawns_timeout():
	if Globals.eneimesIn > maxSpawn:
		return
	
	var spawnPoint: Array = $spawns.get_children()
	var spawnZombie = spawnPoint[randi() % spawnPoint.size()]
	
	zombie.emit(spawnZombie.global_position, ((get_global_mouse_position() - position).normalized()) )


func _on_i_fram_timeout():
	set_collision_layer_value(1,true)


