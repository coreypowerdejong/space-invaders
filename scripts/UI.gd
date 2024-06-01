extends CanvasLayer

var score := 0
var lives := 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass

func set_score(score: int):
	$LivesScoreContainer/ScoreLabel.text = "Score: " + str(score)

func set_lives(lives: int):
	$LivesScoreContainer/LivesLabel.text = "Lives: " + str(lives)


func game_over():
	pass
