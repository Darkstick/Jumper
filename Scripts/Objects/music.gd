extends Node

func play_music():
	$lavaIntro.play()

func _on_lavaIntro_finished():
	if !Global.game_overed: #this engine sucks when it comes to sounds.
		$lavaRising.play()

func stop_music():
	$lavaRising.stop()
