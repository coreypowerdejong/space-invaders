extends Node2D

const BACKGROUND_STAR = preload("res://scenes/background_star.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if randf() > 0.8:
		var star = BACKGROUND_STAR.instantiate()
		star.global_position.x = randi_range(0, 1280)
		star.global_position.y = 720
		add_child(star)
	print(get_child_count())
