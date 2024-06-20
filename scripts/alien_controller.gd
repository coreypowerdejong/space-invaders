extends Node2D

var alien_scene = load("res://scenes/alien.tscn")
var mothership_scene = load("res://scenes/mothership.tscn")
var direction = 1
const max_counter = 16
var move_counter = 8
var total_aliens
const MAX_MOVE_TIME = 1.5
var move_time: float = MAX_MOVE_TIME
var reduce_time_flag: bool

signal alien_killed
signal mothership_killed

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_alien(x, y):
	var alien = alien_scene.instantiate()
	alien.position.x = x
	alien.position.y = y
	add_child(alien)
	alien.add_to_group("aliens")
	alien.killed.connect(_on_alien_killed)
	
func generate_aliens(x_spacing = 64, y_spacing = 50, y_offset = 25):
	for j in 8:
		for i in range(1, 5):
			add_alien(x_spacing * i - x_spacing / 2, j * y_spacing + y_offset)
			add_alien(-x_spacing * i + x_spacing / 2, j * y_spacing + y_offset)


func move_aliens(x_offset, y_offset):
	if move_counter == max_counter:
		global_position.y += y_offset
		direction *= -1
		move_counter = 0
	else:
		global_position.x += direction * x_offset
	move_counter += 1


func _on_move_timer_timeout():
	if reduce_time_flag:
		$MoveTimer.set_wait_time(move_time)
		reduce_time_flag = false
	var x_offset = 16
	var y_offset = 25
	move_aliens(x_offset,y_offset)


func _on_bomb_timer_timeout():
	var alien_group = get_tree().get_nodes_in_group("aliens")
	if len(alien_group) > 0:
		alien_group[randi_range(0, len(alien_group) - 1)].drop_bomb()


func _on_alien_killed():
	emit_signal("alien_killed")
	move_time -= 0.02
	reduce_time_flag = true


func game_over():
	pass


func reset():
	get_tree().call_group("aliens", "queue_free")
	global_position = Vector2(640, 0)
	direction = 1
	move_counter = 8
	move_time = MAX_MOVE_TIME
	reduce_time_flag = false
	generate_aliens()
	$MoveTimer.set_wait_time(move_time)
	$MoveTimer.start()
	$BombTimer.start()
	$MothershipTimer.start()


func _on_mothership_timer_timeout():
	var mothership = mothership_scene.instantiate()
	mothership.killed.connect(_on_mothership_killed)
	mothership.add_to_group("aliens")
	get_parent().add_child(mothership)

func _on_mothership_killed():
	emit_signal("mothership_killed")

