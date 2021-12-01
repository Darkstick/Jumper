extends Node

#all the platforms that will appear#
var basicPlatform = preload("res://Scenes/Objects/basicPlatform.tscn")
var thinPlatform = preload("res://Scenes/Objects/thinPlatform.tscn")
var icyPlatform = preload("res://Scenes/Objects/icyPlatform.tscn")

#number of platforms that will appear in this stage before the exit platform appears
export var platformNum = 5

#keeps track of the height of the last platform
var previousY = 0
var previousX = 0

#randomness
var rng = RandomNumberGenerator.new()

func _ready():
	for i in platformNum:
		#horizontal position selection
		rng.randomize()
		var x = rng.randf_range(30, 1004)
		
		#height selection
		rng.randomize()
		var y = rng.randf_range(-100, -210) #210 is the current max player jump
		var platform = basicPlatform.instance()
		platform.position.y = y + previousY
		platform.position.x = x
		previousY = platform.position.y
		add_child(platform)
