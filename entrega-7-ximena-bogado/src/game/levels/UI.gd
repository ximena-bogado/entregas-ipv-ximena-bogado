extends CanvasLayer

onready var pause_popup: Node = $Menus/PausePopup
onready var defeat_popup: Node = $Menus/DefeatPopup
onready var victory_popup: Node = $Menus/VictoryPopup
signal exit
signal restart_level

func _unpause():
	pause_popup.hide()
	get_tree().paused = false

func _on_PauseButton_pressed():
	get_tree().paused = true
	pause_popup.show()

func _on_RestartButton_pressed():
	_unpause()

func _on_ExitButton_pressed():
	_unpause()
	emit_signal("exit")


func _on_player_died():
	defeat_popup.show()

func _on_RestartLevelButton_pressed():
	defeat_popup.hide()
	emit_signal("restart_level")
	
func _on_player_win():
	victory_popup.show()
