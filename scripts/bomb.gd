extends Area2D

const SPEED = 200
signal clear

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y += delta * SPEED


func _on_screen_exited():
	queue_free()


func _on_area_entered(area):
	queue_free()

func clear_me():
	queue_free()
