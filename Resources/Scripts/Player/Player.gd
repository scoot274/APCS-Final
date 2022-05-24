extends KinematicBody2D

signal health_updated(health)
signal killed()

# Instantiate velocity variables
export (int) var speed = 15000 # Export speed to make it accesible in the editor for debugging purposes
var velocity = Vector2.ZERO # velocity = (0, 0)
export(int) var dashSpeed = 8000

export (float) var max_health = 100 setget _set_health

onready var health = max_health
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
	
	if(Input.is_action_just_pressed("ui_select")):
		dash(movement)
		pass
	pass 




func dash(Movement):
	var dashStrength

	dashStrength = Vector2 (
		Movement.x,
		Movement.y
	)

	if(dashStrength == Vector2(0, 0)): 
		dashStrength = Vector2(1,0)
		pass
		
	move_and_slide(dashStrength * dashSpeed)
	pass

func damage(amount):
	_set_health(health - amount)

func kill():
	print("Dead")
	pass

func _ready():
	print_debug("Player instance created and initialized") 
	pass

func _set_health(value):
	var prev_health = health
	health = clamp(value, 0, max_health)
	if health != prev_health:
		emit_signal("health_updated", health)
		if health == 0:
			kill()
			emit_signal("killed")
