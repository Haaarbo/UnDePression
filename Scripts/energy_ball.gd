extends Area2D

@export var speed := 500.0

var direction := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_area_entered(area: Area2D) -> void:
	print("ACERTOU")
	
	if area is Enemy:
		area.queue_free()   # mata o inimigo
		queue_free()        # destrói a bola
