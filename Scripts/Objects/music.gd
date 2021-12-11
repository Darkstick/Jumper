extends Node

func play_music():
	$lavaIntro.play()

func _on_lavaIntro_finished():
	$lavaRising.play()

func stop_music():
	$lavaRising.stop()
