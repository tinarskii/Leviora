extends Area2D

export(String, FILE, "*.tscn") var Map = ""

func _on_Diamond_body_entered(body):
	queue_free()
	get_tree().change_scene(Map)
