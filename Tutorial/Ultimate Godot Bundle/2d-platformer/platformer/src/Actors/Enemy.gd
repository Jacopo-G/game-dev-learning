extends "res://src/Actors/Actor.gd"

func _ready() -> void:
	set_physics_process(false)
	_velocity.x = -speed.x


func _on_VisibilityNotifier2D_screen_entered() -> void:
	set_physics_process(true)


func _on_StompDetector_body_entered(body: Node) -> void:
	if body.global_position.y > $StompDetector.global_position.y:
		return
	$CollisionShape2D.disabled = true
	queue_free()


func _physics_process(delta: float) -> void:
	if is_on_wall():
		_velocity.x *= -1.0
	_velocity.y += gravity * delta
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
