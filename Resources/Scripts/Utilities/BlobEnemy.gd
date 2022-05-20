extends KinematicBody2D

const WALK_SPEED = 175

onready var player = get_node("/root/World/Player")

func _physics_process(delta):
	if player:
		var direction = (player.position - position).normalized()
		
		move_and_slide(direction * WALK_SPEED)

	
	
