extends AbstractState

func enter() -> void:
	character._play_animation("dead")
	character._remove()



