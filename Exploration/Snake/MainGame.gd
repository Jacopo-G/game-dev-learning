extends Node2D

var snake_body = [Vector2(7, 7)]

var apple_pos
var index = Vector2.ZERO

func _ready():
	randomize()
	spawn_apple()

func spawn_apple():
	apple_pos = Vector2(rand_range(0, 15), rand_range(0, 15))
	$SnakeAppleMap.set_cell(apple_pos.x, apple_pos.y, 1, false, false, false, index)

var direction = Vector2.ZERO

func _process(_delta):
	if Input.is_action_pressed("move_right") and direction.x != -1:
		direction.x = 1
		direction.y = 0
	elif Input.is_action_pressed("move_left") and direction.x != 1:
		direction.x = -1
		direction.y = 0
	elif Input.is_action_pressed("move_down") and direction.y != -1:
		direction.y = 1
		direction.x = 0
	elif Input.is_action_pressed("move_up") and direction.y != 1:
		direction.y = -1
		direction.x = 0

func make_snake():
	for part in snake_body:
		$SnakeAppleMap.set_cell(part.x, part.y, 0, false, false, false, index)

func _on_SnakeGameTick_timeout():
	snake_body.append(Vector2(snake_body[-1].x + direction.x, snake_body[-1].y + direction.y))
	if apple_pos in snake_body:
		print(snake_body)
	else:
		$SnakeAppleMap.set_cell(snake_body[0].x, snake_body[0].y, -1, false, false, false, index)
		snake_body.remove(0)
		print(snake_body)
	make_snake()

