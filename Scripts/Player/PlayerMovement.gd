extends KinematicBody2D

var speed = 200
var velocity = Vector2.ZERO

func _physics_process(delta):
	var movement = Vector2(
			# Calculate X strength
			Input.get_action_strength("right") - Input.get_action_strength("left"),
			#Calculate Y strength
			Input.get_action_strength("down") - Input.get_action_strength("up")
		)
	if(movement.length() > 1.0): 
		movement = movement.normalized()
	move_and_slide(movement)
	pass 
	

func _ready():
	pass
