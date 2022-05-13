extends KinematicBody2D

var speed = 200
var velocity = Vector2.ZERO

func _physics_process(delta):
	var movement = Vector2(
			# Calculate X strength
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			#Calculate Y strength
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)
	if(movement.length() > 1.0): 
		movement = movement.normalized()
	move_and_slide(movement * speed)
	pass 

func _ready():
	pass
