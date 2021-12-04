extends Node

#all the platforms that will appear#
var basicPlatform = preload("res://Scenes/Objects/basicPlatform.tscn")
var thinPlatform = preload("res://Scenes/Objects/thinPlatform.tscn")
var icyPlatform = preload("res://Scenes/Objects/icyPlatform.tscn")

#number of platforms that will appear in this stage before the exit platform appears
export var platformNum = 5

#randomness
var rng = RandomNumberGenerator.new()

#keeps track of the height of the last platform
var previousY = 0
var previousX = 0

func _ready():
	for i in platformNum:
		rng.randomize()
		
		#choses if the next platform will be to the left or the right of the previous one. 0 = left, 1 = right
		var lor = rng.randi_range(0, 1)
		
		#horizontal position selection
		var x = 0
		if lor == 1:
			x = rng.randf_range((previousX + 100), (previousX + 230))
		if lor == 0:
			x = rng.randf_range((previousX - 230), (previousX - 100))
		
		#make sure the platform isn't out of bounds
		if x < 30 || x > 1024:
			x = rng.randf_range(400, 600)
		
		#height selection
		rng.randomize()
		var y = rng.randf_range(-100, -210) #210 is the current max player jump
		
		#platform type selection
		var type = rng.randi_range(0, 10)
		var platform = null
		if(type >= 9):
			platform = icyPlatform.instance()
		else:
			platform = basicPlatform.instance()
		
		platform.position.y = y + previousY
		platform.position.x = x
		previousY = platform.position.y
		previousX = platform.position.x
		add_child(platform)