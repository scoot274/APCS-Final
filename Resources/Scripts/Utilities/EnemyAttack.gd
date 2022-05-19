extends KinematicBody2D


onready var player = get_node("/root/World/Player")
const WALK_SPEED = 175
const GRAVITY =600

func _ready():
	pass
func _physics_process(delta):
	if player:
			var direction = (player.position - position).normalized()
			if not is_on_wall():
				direction.y +=GRAVITY
			
			move_and_slide(direction * WALK_SPEED)

	
	
