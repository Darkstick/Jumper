extends AudioStreamPlayer2D

func play_sound(player : AudioStreamPlayer2D, sfx : AudioStream):
	player.stream = sfx
	player.play()
