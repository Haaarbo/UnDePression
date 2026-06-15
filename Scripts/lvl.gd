extends Node2D

@export var enemy_scene: PackedScene
@onready var player = $Char
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout():
	var enemy = enemy_scene.instantiate()

	add_child(enemy)

	enemy.player = player

	var size = get_viewport().get_visible_rect().size

	match randi() % 4:
		0:
			enemy.global_position = Vector2(randf_range(0, size.x), -50)

		1:
			enemy.global_position = Vector2(randf_range(0, size.x), size.y + 50)

		2:
			enemy.global_position = Vector2(-50, randf_range(0, size.y))

		3:
			enemy.global_position = Vector2(size.x + 50, randf_range(0, size.y))
