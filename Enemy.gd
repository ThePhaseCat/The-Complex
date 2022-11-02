extends KinematicBody2D

var motion = Vector2()
var health = 75

var speed = 2.5
func _ready():
	pass

func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")
	
	motion += (Vector2(Player.position) - position)
	look_at(Player.position)
	
	motion = motion.normalized() * speed
	move_and_collide(motion)


func health_change():
	health = health - 10

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		if health <= 0:
			queue_free()
		else:
			health_change()
			speed = 0
			yield(get_tree().create_timer(0.5), "timeout")
			speed = 2.5


func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		$Sprite.show()


func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		$Sprite.hide()
