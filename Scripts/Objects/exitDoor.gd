extends Area2D


func get_input():
	if Input.is_action_just_pressed("up"):
		z_index = -100
		if get_overlapping_bodies().size() == 1:
			Global.platforms += 1
			Ui.update_floor()
			get_tree().change_scene("res://Scenes/Levels/main.tscn")

func _physics_process(_delta):
	get_input()
