extends Entities

class_name Player

# Bola de energia (ataque)
@export var energy_ball_scene: PackedScene

const SPEED: float = 300.0

func _physics_process(delta: float) -> void:
	# Input
	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	# Physics
	velocity = direction * SPEED
	
	# Movement
	move_and_slide()

func shoot() -> void:
	if is_attacking:
		return
	
	is_attacking = true
	
	# Toca animatino do jogador
	#$charAni.play("attack")
	
	var ball = energy_ball_scene.instantiate()
	get_tree().current_scene.add_child(ball)

	var dir = (get_global_mouse_position() - global_position).normalized()

	ball.global_position = global_position + dir * 32
	ball.direction = dir

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			shoot()


func _on_char_ani_animation_finished(anim_name: StringName) -> void:
	if anim_name == "attack":
		is_attacking = false
		#$charAni.play("idle")
