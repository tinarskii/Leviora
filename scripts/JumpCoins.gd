extends Area2D

func _on_JumpCoins_body_entered(body):
	queue_free()
