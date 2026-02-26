extends Area2D
@onready var player: CharacterBody2D = $"../../Players/Player"
@onready var player_2: CharacterBody2D = $"../../Players/Player2"
@onready var portal: Area2D = $"../Portal"
@onready var portal_2: Area2D = $"../Portal2"

var cooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func teleport(player):
	if(player.cooldown > 1):
		if(self==portal):
			player.position=portal_2.position
		else:
			player.position=portal.position
		player.cooldown = 0

func _on_body_entered(body: Node2D) -> void:
	if(body==player):
		teleport(player)
	elif(body==player_2):
		teleport(player_2)
