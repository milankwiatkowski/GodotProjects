extends Control

# Ścieżki do scen
var levels = {
	"Level1": "res://scenes/levels/level01.tscn",
	"Level2": "res://scenes/levels/level02.tscn",
	"Level3": "res://scenes/levels/level03.tscn",
	"Level4": "res://scenes/levels/level04.tscn",
	"Level5": "res://scenes/levels/level05.tscn",
	"Level6": "res://scenes/levels/level06.tscn",
	"Level7": "res://scenes/levels/level07.tscn",
	"Level8": "res://scenes/levels/level08.tscn",
	"Level9": "res://scenes/levels/level09.tscn",
	"Level10": "res://scenes/levels/level10.tscn",
	"Level11": "res://scenes/levels/level11.tscn",
	"Level12": "res://scenes/levels/level12.tscn",
	"Level13": "res://scenes/levels/level13.tscn",
	"Level14": "res://scenes/levels/level14.tscn",
	"Level15": "res://scenes/levels/level15.tscn"
}

func _ready():
	for button_name in levels.keys():
		var button = $VBoxContainer.get_node(button_name)
		if button:
			# Lambda przekazująca konkretny level_path
			button.pressed.connect(func():
				load_level(levels[button_name]))
		else:
			print("Nie znaleziono przycisku: ", button_name)

func load_level(level_path: String):
	var packed_scene = load(level_path) as PackedScene
	if packed_scene:
		get_tree().change_scene_to_packed(packed_scene) # <-- tu zmiana
	else:
		print("Nie udało się załadować sceny: ", level_path)
