extends Node

export (PackedScene) var level_manager
## HINT: Mouse input won't work by default for any button added because some other
## Control node will consume the mouse input first.
## Check what does the property Control.mouse_filter do in the docs and experiment.


func _on_Container_start_game():
	get_tree().change_scene_to(level_manager) 


func _on_ExitButton_pressed():
	get_tree().quit()
