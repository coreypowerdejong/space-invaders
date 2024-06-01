extends Node2D

var score := 0
var lives := 3
var alien_count := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	alien_count = len(get_tree().get_nodes_in_group("aliens"))
	if alien_count == 0:
		$UI.game_over(score, true)
		$Player.game_over()
		$AlienController.game_over()
		get_tree().paused = true


func _on_alien_killed(value = 100):
	score += value
	$UI.set_score(score)

func _on_player_hit():
	lives -= 1
	$UI.set_lives(lives)
	if lives == 0:
		$UI.game_over(score)
		$Player.game_over()
		$AlienController.game_over()
		get_tree().paused = true

func reset():
	score = 0
	lives = 3
	$UI.set_score(score)
	$UI.set_lives(lives)
	get_tree().paused = false
	$AlienController.reset()


func _on_replay():
	reset()



