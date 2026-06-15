extends State

func _start():
	actor.charAni.play("Run")

func _run(delta):
	actor.direction = Input.get_vector(
		"left",
		"right",
		"up",
		"down"
	)

	actor.velocity = actor.direction * actor.SPEED
	actor.move_and_slide()

	if actor.direction == Vector2.ZERO:
		manager.switch_state("Idle")

	if Input.is_action_just_pressed("shoot"):
		manager.switch_state("Attack")
