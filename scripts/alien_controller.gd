extends Node2D

var alien_scene = load("res://scenes/alien.tscn")
var direction = 1
const max_counter = 16
var move_counter = 8
var total_aliens

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_aliens()
	total_aliens = len(get_tree().get_nodes_in_group("aliens"))



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
			alien.add_to_group("aliens")
			var alien2 = alien_scene.instantiate()
			alien2.position.x = -x_spacing * i + x_spacing / 2
			alien2.position.y = j * y_spacing + y_offset
			add_child(alien2)
			alien2.add_to_group("aliens")


func move_aliens(x_offset, y_offset):
	if move_counter == max_counter:
		global_position.y += y_offset
		direction *= -1
		move_counter = 0
	else:
		global_position.x += direction * x_offset
	move_counter += 1
	


func _on_move_timer_timeout():
	var x_offset = 16
	var y_offset = 25
	move_aliens(x_offset,y_offset)
