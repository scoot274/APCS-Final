extends Camera2D

onready var player = get_node("/root/World/Player")

func _ready():
	print("CameraFollow Initialized")
	pass

func _process(delta):
	position = player.position
	pass

