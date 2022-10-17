extends KinematicBody2D

var velocity = Vector2.ZERO
var screen_size
export (int) var gravity
export (int) var speed
export (int) var jump_height

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	velocity.y += gravity
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else: velocity.x = 0
	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -jump_height
	velocity = move_and_slide(velocity)
	position.x = clamp(position.x, 32, screen_size.x - 32)
	position.y = clamp(position.y, 32, screen_size.y -32)
