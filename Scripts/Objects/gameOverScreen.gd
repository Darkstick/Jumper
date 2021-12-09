extends CanvasLayer

func _on_Retry_pressed():
	Global.hp = 3
	Global.platforms = 5
	$AnimationPlayer.play_backwards("slide_in")
	Ui.update_health()
	Ui.update_floor()
	get_tree().change_scene("res://Scenes/Levels/main.tscn")

func _on_Quit_pressed():
	get_tree().quit()
