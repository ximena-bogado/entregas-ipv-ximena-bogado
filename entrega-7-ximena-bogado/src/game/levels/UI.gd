extends CanvasLayer

onready var pause_popup: Node = $PausePopup
signal exit

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
