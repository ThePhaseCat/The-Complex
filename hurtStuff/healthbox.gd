extends KinematicBody2D

func _ready():
	pass

func _physics_process(delta):
	pass

func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		yield(get_tree().create_timer(0.1), "timeout")
		queue_free()
