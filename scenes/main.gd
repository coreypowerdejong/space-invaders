extends Node2D

var score := 0
var lives := 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_alien_killed(value = 100):
	score += value
	$UI.set_score(score)


func _on_player_hit():
	lives -= 1
	$UI.set_lives(lives)
	if lives == 0:
		$UI.game_over()
		$Player.game_over()
		$AlienController.game_over()
		get_tree().paused = true
