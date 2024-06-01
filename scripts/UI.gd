extends CanvasLayer

signal replay

# Called when the node enters the scene tree for the first time.
func _ready():
	reset()


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass

func set_score(score: int):
	$LivesScoreContainer/ScoreLabel.text = "Score: " + str(score)

func set_lives(lives: int):
	$LivesScoreContainer/LivesLabel.text = "Lives: " + str(lives)


func game_over(score: int):
	$LivesScoreContainer.hide()
	$GameOverScreen/ScoreContainer/ScoreLabel.text = "Score: " + str(score)
	$GameOverScreen.show()

func reset():
	$GameOverScreen.hide()
	$LivesScoreContainer.show()

func _on_retry_button_pressed():
	reset()
	emit_signal("replay")
