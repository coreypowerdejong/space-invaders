extends Area2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var velocity := Vector2.ZERO

var bullet_scene = load("res://scenes/bullet.tscn")
var bullet_shot: bool = false

signal hit

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	global_position += velocity*delta

func _input(event):
	if event.is_action_pressed("shoot") and !bullet_shot:
		var bullet = bullet_scene.instantiate()
		bullet.global_position = global_position
		bullet.clear.connect(_bullet_clear)
		bullet.add_to_group("projectiles")
		get_parent().add_child(bullet)
		bullet_shot = true
		

func _bullet_clear():
	bullet_shot = false



func _on_area_entered(area):
	emit_signal("hit")


func game_over():
	pass

func reset():
	global_position.x = 640
