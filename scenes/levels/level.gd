extends Node2D


var shoot
var dead:bool = false


var bulletScean: PackedScene = preload("res://scenes/prjectiles/bullet/bullets.tscn")
var zombieScean: PackedScene = preload("res://scenes/ememies/zombie/zombie.tscn")



func _process(_delta):
	if Globals.reset == true:
		Globals.reset = false
		get_tree().reload_current_scene()
	else:
		if Globals.night and Globals.timeDay == 5:
			toDay()
		if !Globals.night and Globals.timeDay == 10:
			toNight()
		
		$enemines.position = Vector2.ZERO
		Globals.eneimesIn = $enemines.get_child_count()
		
		Globals.playerPos = $player.position

		
		if(Globals.playerHealth <= 0 and !dead):
			
			TransitionLayer.change_scean("res://scenes/levels/death/death.tscn")
			
			dead = true




func _on_player_shoot(pos, direction):
	shoot = bulletScean.instantiate() as Area2D
	shoot.position = pos
	shoot.rotation_degrees = rad_to_deg(direction.angle()) + 90
	shoot.direction = direction
	
	$projectiles.add_child(shoot)

func toDay():
	var tween = get_tree().create_tween()
	tween.parallel() 
	tween.tween_property($ground/ligher,"energy",.25,5)
	tween.tween_property($ground/darker,"energy", 0, 5)
func toNight():
	var tween = get_tree().create_tween()
	tween.parallel() 
	tween.tween_property($ground/ligher,"energy",0,10)
	tween.tween_property($ground/darker,"energy", .8, 10)










func _on_player_zombie(pos, _direction):
	var spawnZombie = zombieScean.instantiate() as CharacterBody2D
	
	spawnZombie.position = pos
	$enemines.add_child(spawnZombie)






func _on_food_heal_body_entered(_body):
	$player.playerHealth = 100
	$obj/foodHeal.queue_free()
