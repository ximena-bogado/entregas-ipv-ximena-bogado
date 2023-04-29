extends CanvasLayer


func show_game_over():
	show_message("Game Over")
	
func show_message(text):
	$Message.text = text
	$Message.show()
