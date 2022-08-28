extends Node2D

export(int) var start_x = 0
export(int) var start_y = 0

func restart():
	get_tree().reload_current_scene()

func _process(delta):
	if Input.is_action_pressed("player_restart"):
		restart()

func _on_Restart_body_entered(body):
	restart()
