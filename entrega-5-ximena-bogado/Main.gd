extends Node

onready var player = $Player
onready var turret_spawner = $TurretsSpawner

func _ready():
	randomize()
	player.initialize(self)
	
func game_over():
	$CanvasLayer2.show_game_over()
