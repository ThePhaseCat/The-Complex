extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$name.set_text("Test Level")


func _on_levelbasebutton_pressed():
	GlobalSettings.current_level = "testlevel"
	get_tree().change_scene("res://world.tscn")
