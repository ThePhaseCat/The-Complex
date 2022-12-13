extends KinematicBody2D

signal set_health(health_max)
signal new_health(new_health)
signal health_heal(health_healed)
signal died()
signal win()


signal startTimer()
signal stopTimer()


var movespeed = 200
var bullet_speed = 1000
var previous_position = global_position
var weapon_select = 1
var bullet = preload("res://Bullet.tscn")
var bullet2 = preload("res://Bullet2.tscn")

var ak_sound = preload("res://ak_sound.tscn")
var smg_sound = preload("res://smg_sound.tscn")

var health = 50

var bullet_instance
var bullet_instance2

var parent_rotation 

func _ready():
	print(GlobalSettings.current_level)
	set_physics_process(true)
	emit_signal("startTimer")
	$key.hide()
	emit_signal("set_health", health)
	GlobalSettings.deathSpike = false
	GlobalSettings.keyHave = false

func _physics_process(delta):
	moveCheck()
	var motion = Vector2()
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	
	if Input.is_action_pressed("up") and not $walksound.playing:
		$walksound.play()
	if Input.is_action_pressed("down") and not $walksound.playing:
		$walksound.play()
	if Input.is_action_pressed("left") and not $walksound.playing:
		$walksound.play()
	if Input.is_action_pressed("right") and not $walksound.playing:
		$walksound.play()
	
	motion = motion.normalized()
	motion = move_and_slide(motion * movespeed)
	look_at(get_global_mouse_position())
	
	if GlobalSettings.deathSpike == true:
		kill()
#
#	#if Input.is_action_just_pressed("weapon 1"):
#		weapon_select = 1
#	#if Input.is_action_just_pressed("weapon 2"):
#		weapon_select = 2

	#if Input.is_action_just_pressed("LMB"):
#		if weapon_select == 1:
#			fire()
#			$ak_sound.play()
#		if weapon_select == 2:
#			fire2()
#			$smg_sound.play()
	
	if(GlobalSettings.keyHave == true):
		$key.show()
	if(GlobalSettings.keyHave == false):
		$key.hide()
	if(health <= 0):
		kill()

func moveCheck():
	if global_position != previous_position:
		pass
	else:
		$walksound.stop()
	previous_position = global_position

func fire():
	bullet_speed = 500
	var bullet_instance = bullet.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	#sound1()
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().get_root().call_deferred("remove_child", bullet_instance)

func fire2():
	bullet_speed = 1000
	var bullet_instance2 = bullet2.instance()
	bullet_instance2.position = get_global_position()
	bullet_instance2.rotation_degrees = rotation_degrees
	bullet_instance2.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child", bullet_instance2)
	#sound2()
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().get_root().call_deferred("remove_child", bullet_instance2)

func sound1():
	var ak_sound_instance = ak_sound.instance()
	ak_sound_instance.position = get_global_position()
	ak_sound_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child", ak_sound_instance)
	ak_sound_instance.play()
	#yield(get_tree().create_timer(0.55), "timeout")
	get_tree().get_root().call_deferred("remove_child", ak_sound_instance)

func sound2():
	var smg_sound_instance = smg_sound.instance()
	smg_sound_instance.position = get_global_position()
	smg_sound_instance.rotation_degrees = rotation_degrees
	get_tree().get_root().call_deferred("add_child", smg_sound_instance)
	smg_sound_instance.play()
	yield(get_tree().create_timer(0.11), "timeout")
	get_tree().get_root().call_deferred("remove_child", smg_sound_instance)

func kill():
	$walksound.stop()
	emit_signal("stopTimer")
	set_physics_process(false)
	$scaleAni.play("scale")
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("died")
	#get_tree().reload_current_scene()

func health_change(value):
	health = health - value
	emit_signal("new_health", health)


func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		health_change(10)
		hit_flash()
	if "EnemyGunStuff" in body.name:
		health_change(50)
		hit_flash()
	if "EnemyTeleportStuff" in body.name:
		health_change(15)
		hit_flash()
	if "TurretGunStuff" in body.name:
		health_change(25)
		hit_flash()
	if "HealthBox" in body.name:
		health = 50
		emit_signal("health_heal", health)
	if "keyNode" in body.name:
		pass
	if "BossWall" in body.name:
		kill()


func hit_flash():
	$Sprite.self_modulate = Color(255, 0, 0)
	yield(get_tree().create_timer(0.1), "timeout")
	$Sprite.self_modulate = Color(255, 255, 255)
	yield(get_tree().create_timer(0.1), "timeout")
	$Sprite.self_modulate = Color(255, 0, 0)
	yield(get_tree().create_timer(0.1), "timeout")
	$Sprite.self_modulate = Color(255, 255, 255)
	yield(get_tree().create_timer(0.1), "timeout")
	$Sprite.self_modulate = Color(255, 0, 0)
	yield(get_tree().create_timer(0.1), "timeout")
	$Sprite.self_modulate = Color(255, 255, 255)



func _on_Area2D_area_entered(area):
	if "teleport" in area.name:
		emit_signal("win")
