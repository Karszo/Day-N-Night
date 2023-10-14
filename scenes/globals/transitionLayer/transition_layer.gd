extends CanvasLayer

func change_scean(tarrget:String) -> void:
	$AnimationPlayer.play("fade to black")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("reveart")
	get_tree().change_scene_to_file(tarrget)
	
