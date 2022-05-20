extends Node

export (Array, Resource) var enemies

func _ready():
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://Blob.tscn")
	
	var screen_size = get_viewport().get_visible_rect().size
	
	for i in range(0,5):
		var enemy = enemyscene.instance()
		spawn(enemy, rand, screen_size)

func _process(delta):
	
	pass

func spawn(enemy, random, screenSize): 
	random.randomize()
	var x  = random.randf_range(0, screenSize.x)
	random.randomize()
	var y  = random.randf_range(0, screenSize.y)
	enemy.position.y = y
	enemy.position.x = x
	add_child(enemy)
