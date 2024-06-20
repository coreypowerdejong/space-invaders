extends Area2D

var bomb_scene = load("res://scenes/bomb.tscn")
signal killed
var type: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite2D.set_animation(str(type))


func _on_area_entered(area):
	emit_signal("killed")
	queue_free()


func drop_bomb():
	var bomb = bomb_scene.instantiate()
	bomb.global_position = global_position
	bomb.add_to_group("projectiles")
	get_parent().get_parent().add_child(bomb)

func set_type(type: int):
	self.type = type
