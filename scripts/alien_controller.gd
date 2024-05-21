extends Node2D

var alien_scene = load("res://scenes/alien.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_aliens()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func generate_aliens(x_spacing = 64, y_spacing = 50, y_offset = 25):
	for j in 8:
		for i in range(1, 5):
			var alien = alien_scene.instantiate()
			alien.position.x = x_spacing * i - x_spacing / 2
			alien.position.y = j * y_spacing + y_offset
			add_child(alien)
			var alien2 = alien_scene.instantiate()
			alien2.position.x = -x_spacing * i + x_spacing / 2
			alien2.position.y = j * y_spacing + y_offset
			add_child(alien2)
				
			
