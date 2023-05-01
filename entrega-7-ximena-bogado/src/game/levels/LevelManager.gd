extends Node

export (Array, PackedScene) var levels: Array
onready var current_level_container: Node = $CurrentLevelContainer
onready var gui: Control = $UI/GUI

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

## Hint: for pause check the SceneTree.paused property.
func _on_UI_exit():
	get_tree().change_scene("res://src/screens/MainMenu.tscn")
	
