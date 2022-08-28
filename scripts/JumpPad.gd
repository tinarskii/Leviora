extends Area2D

export(int) var JUMP_ENERGY = 1000
onready var animate_sprite = $AnimatedSprite

func _on_JumpPad_body_entered(body):
	if body.velocity.y > 0:
		body.velocity.y = -JUMP_ENERGY
		animate_sprite.play("Active")
		
func _on_JumpPad_body_exited(body):
	yield(get_tree().create_timer(1.0), "timeout")
	animate_sprite.play("Idle")
