extends CanvasLayer

var initialPlatformNum = Global.platforms - 1

func _ready():
	$GUI/VBoxContainer/Life/LifeCounter.text = str(Global.hp)
	$GUI/VBoxContainer/Floor/FloorCounter.text = str((Global.platforms) - initialPlatformNum)

func update_health():
	$GUI/VBoxContainer/Life/LifeCounter.text = str(Global.hp)

func update_floor():
	$GUI/VBoxContainer/Floor/FloorCounter.text = str((Global.platforms) - initialPlatformNum)
