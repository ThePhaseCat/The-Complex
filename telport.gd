extends Area2D

func _on_teleport_body_entered(body):
	if "Player" in body.name:
		get_tree().change_scene('res://level2.tscn')
