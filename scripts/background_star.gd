extends ColorRect

var velocity: int

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = randi_range(300, 500)
	var my_scale = randf_range(0.8, 1.2)
	scale = Vector2(my_scale, my_scale)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y -= delta * velocity


func _on_screen_exited():
	queue_free()
