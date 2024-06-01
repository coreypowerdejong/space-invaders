extends Area2D

var bomb_scene = load("res://scenes/bomb.tscn")
signal killed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	emit_signal("killed")
	queue_free()


func drop_bomb():
	var bomb = bomb_scene.instantiate()
	bomb.global_position = global_position
	get_parent().get_parent().add_child(bomb)
