extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalSettings.fps_counter == true:
		visible = true
	if GlobalSettings.fps_counter == false:
		visible = false

func _process(delta: float) -> void:
	set_text("FPS: " + String(Engine.get_frames_per_second()))
