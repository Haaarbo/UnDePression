extends CharacterBody2D

class_name Player

const SPEED: float = 300.0

func _physics_process(delta: float) -> void:
	# Input
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	# Physics
	velocity = direction * SPEED
	
	# Movement
	move_and_slide()
