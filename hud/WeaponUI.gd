extends CanvasLayer

func _ready():
	$WeaponUI/weapon1.show()
	$WeaponUI/weapon2.hide()

func _physics_process(delta):
	if GlobalSettings.weaponNumber == 1:
		$WeaponUI/weapon1.show()
		$WeaponUI/weapon2.hide()
	if GlobalSettings.weaponNumber == 2:
		$WeaponUI/weapon2.show()
		$WeaponUI/weapon1.hide()
