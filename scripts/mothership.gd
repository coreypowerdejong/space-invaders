extends Area2D

signal killed

var velocity := 0
var direction: int
var start: String

const SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	var movement = randi_range(0, 1)
	direction = [1, -1][movement] # random 1 or -1
	velocity = direction * SPEED
	global_position.x = movement * 1280 - direction * 64 # -64 or 1344 (just off screen)
	global_position.y = 300


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.x += velocity * delta


func _on_area_entered(area):
	emit_signal("killed")
	queue_free()


func _on_screen_exited():
	queue_free()

func drop_bomb():
	pass
