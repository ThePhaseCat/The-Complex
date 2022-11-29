extends KinematicBody2D

var motion = Vector2()
var speed = 5
var health = 1

func _ready():
	$Sprite.hide()
	set_physics_process(false)


func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")

	motion += (Vector2(Player.position) - position)
	look_at(Player.position)

	motion = motion.normalized() * speed
	move_and_collide(motion)
	
	if(health <= 0):
		queue_free()

func health_change():
	health = health - 25

func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		health_change()
		speed = 0
		yield(get_tree().create_timer(0.1), "timeout")
		speed = 5

func _on_StealhDetectArea_body_entered(body):
	if "Player" in body.name:
		yield(get_tree().create_timer(1.0), "timeout")
		set_physics_process(true)



func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		$Sprite.show()


func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		$Sprite.hide()
