extends Node

export (Array, PackedScene) var levels: Array
onready var current_level_container: Node = $CurrentLevelContainer
onready var gui: Control = $UI/GUI
onready var ui: CanvasLayer = $UI

func _ready() -> void:
	initialize()
	
func initialize() -> void:
	_setup_level(0)

## This won't run by itself. Use all variables and functions necessary to run this correctly.

func _setup_level(id: int) -> void:
	if id >= 0 && id < levels.size():
		if current_level_container.get_child_count() > 0:
			for child in current_level_container.get_children():
				current_level_container.remove_child(child)
				child.queue_free()
		
		var level_instance: GameLevel = levels[id].instance()
		current_level_container.add_child(level_instance)
		
		level_instance.player.connect("hit",gui, "change_heart_bar")
		level_instance.player.connect("dead",ui, "_on_player_died")
		level_instance.player.connect("win",ui, "_on_player_win")
		gui.connect("player_died",level_instance.player, "die")

## Hint: for pause check the SceneTree.paused property.
func _on_UI_exit():
	get_tree().change_scene("res://src/screens/MainMenu.tscn")
	
func _on_UI_restart_level():
	_setup_level(0)
	gui.restart_heart_bar()
