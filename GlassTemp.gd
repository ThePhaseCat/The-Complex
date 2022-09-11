extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	$Particles2D.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		$Particles2D.show()
		yield(get_tree().create_timer(0.5), "timeout")
		queue_free()
