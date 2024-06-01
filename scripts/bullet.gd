extends Area2D

const SPEED = 200
signal clear

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y -= delta * SPEED


func _on_screen_exited():
	clear_me()

func _on_area_entered(area):
	clear_me()

func clear_me():
	emit_signal("clear")
	queue_free()
