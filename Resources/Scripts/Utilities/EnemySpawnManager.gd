extends Node

export (Array, Resource) var enemies

var rand = RandomNumberGenerator.new()
var screen_size

func _ready():
	# -- DEPRACATE --
	# var enemyscene = load("res://Blob.tscn")
	# var enemy = enemyscene.instance()

	screen_size = get_viewport().get_visible_rect().size
	# TODO fix enemies spawning in walls/out of map

func _process(delta):
	var enemyCount = get_tree().get_nodes_in_group("Enemies").size()

	# Would like more control over enemy count i.e. [ {Enemy: lorem, Count: 123214}, Enemy: ipsum, Count: 5 ]

	if(enemyCount <= 5):
		spawn(rand, screen_size)
	pass

func spawn(random, screenSize):
	random.randomize() # Scramble random seed
	
	## -- DEPRACATE --
	#var x  = random.randf_range(0, screenSize.x)
	#random.randomize()
	#var y  = random.randf_range(0, screenSize.y)
	#enemy.position.y = y
	#enemy.position.x = x
	#add_child(enemy)

	# Get instance of a random enemy from the array
	var chosenEnemy = enemies[random.randf_range(0, enemies.size() - 1)].instance() 
	
	var enemyPos = Vector2(
		random.randf_range(0, screenSize.x),
		random.randf_range(0, screenSize.y)
	)
	chosenEnemy.position.x = enemyPos.x
	chosenEnemy.position.y = enemyPos.y

	return add_child(chosenEnemy)	

