extends Node2D

const BUNKER_BLOCK = preload("res://scenes/bunker_block.tscn")
var width: int
# Called when the node enters the scene tree for the first time.
func _ready():
	generate_blocks()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func generate_blocks():
	for i in range(-2, 2):
		for j in range(-2, 2):
			var block = BUNKER_BLOCK.instantiate()
			width = block.width
			block.position = Vector2(i * width, j * width)
			add_child(block)
