extends KinematicBody2D

var motion = Vector2()
var speed = 1
var bulletSpeed = 500

var bulletAttack = preload("res://EnemyGunStuff.tscn")

func _ready():
	set_physics_process(true)
	


func _physics_process(delta):
	var motion = Vector2()
	var Player = get_parent().get_node("Player")

	motion += (Vector2(Player.position) - position)
	look_at(Player.position)

	motion = motion.normalized() * speed
	move_and_collide(motion)


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		queue_free()


func _on_PlayerDetectArea_body_entered(body):
	if "Player" in body.name:
		speed = 0

func _on_PlayerDetectArea_body_exited(body):
	if "Player" in body.name:
		speed = 1
	else:
		yield(get_tree().create_timer(1.0), "timeout")
		var attack_instance = bulletAttack.instance()
		attack_instance.position = get_global_position()
		attack_instance.rotation_degrees = rotation_degrees
		attack_instance.apply_impulse(Vector2(), Vector2(bulletSpeed, 0).rotated(rotation))
		get_tree().get_root().call_deferred("add_child", attack_instance)
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().get_root().call_deferred("remove_child", attack_instance)
