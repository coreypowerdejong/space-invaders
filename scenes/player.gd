extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var bullet_scene = load("res://scenes/bullet.tscn")

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _input(event):
	if event.is_action_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.global_position = global_position
		get_parent().add_child(bullet)
