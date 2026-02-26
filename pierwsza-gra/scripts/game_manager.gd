extends Node
@onready var score: Label = $Score
var coins = 0
func add_point():
	coins += 1
	if(coins!=1):
		score.text = "You collected " + str(coins) + " coins."
	else:
		score.text = "You collected " + str(coins) + " coin."
	if(coins==5):
		var number = get_tree().current_scene.name
		number = int(number.right(2)) + 1
		if(number<10):
			number = '0'+str(number)
		get_tree().change_scene_to_file('res://scenes/levels/level'+number+'.tscn')
