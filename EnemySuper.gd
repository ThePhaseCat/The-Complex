extends KinematicBody2D

var motion = Vector2()
var speed = 5
var health = 1

func _ready():
	$Sprite.hide()
	$enemyaboutto.hide()
	$enemydefeatring.hide()
	set_physics_process(false)


func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")

	motion += (Vector2(Player.position) - position)
	look_at(Player.position)

	motion = motion.normalized() * speed
	move_and_collide(motion)
	
	if(health <= 0):
		kill()

func kill():
	$enemydefeatring.show()
	set_physics_process(false)
	$Tween.stop_all()
	$Tween.interpolate_property($Sprite,'modulate:a',$Sprite.get_modulate().a, 0.0,0.25,Tween.TRANS_SINE,Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, 'tween_completed')
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
		$enemyaboutto.show()
		yield(get_tree().create_timer(0.5), "timeout")
		$enemyaboutto.hide()
		yield(get_tree().create_timer(0.5), "timeout")
		set_physics_process(true)



func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		$Sprite.show()


func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		$Sprite.hide()
