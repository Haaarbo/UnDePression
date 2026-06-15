extends State


func _start() -> void: pass

func _run(delta: float) -> void: 
	var dir = Input.get_vector(
		"left",
		"right",
		"up",
		"down"
	)

	if dir != Vector2.ZERO:
		manager.switch_state("Run")

	if Input.is_action_just_pressed("shoot"):
		manager.switch_state("Attack")

func _end() -> void: pass
