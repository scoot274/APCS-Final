extends KinematicBody2D

# Instantiate velocity variables
export (int) var speed = 200 # Export speed to make it accesible in the editor for debugging purposes
var velocity = Vector2.ZERO # velocity = (0, 0)

func _physics_process(delta):
	var movement = Vector2(
			# Calculate X strength
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			#Calculate Y strength
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)
	if(movement.length() > 1.0): 
		movement = movement.normalized()
	move_and_slide(movement * speed * delta)
	pass 

func _ready():
	print_debug("Player instance created and initialized") 
	pass
