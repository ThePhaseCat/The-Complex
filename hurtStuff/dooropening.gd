extends KinematicBody2D

var doorOpened = false

func _ready():
	$buttonopen.hide()
	$buttonclose.show()
	$Sprite/doordetect/CollisionShape2D.disabled = false
	doorOpened = false

func _on_buttondetect_body_entered(body):
	if "Player" in body.name && doorOpened == false:
		doorOpen()
	else:
		pass

func doorOpen():
	$buttonclose.hide()
	$buttonopen.show()
	$Sprite.play("opening")
	yield(get_tree().create_timer(0.2), "timeout")
	$Sprite.queue_free()
	$CollisionShape2D.queue_free()
	doorOpened = true
	#queue_free()
