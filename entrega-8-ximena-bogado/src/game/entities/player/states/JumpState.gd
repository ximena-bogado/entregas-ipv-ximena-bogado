extends AbstractState


# Initialize the state. E.g. change the animation
func enter() -> void:
	character.velocity.y = -character.jump_speed
	character.snap_vector = Vector2.ZERO

func update(delta:float) -> void:
	character._handle_cannon_actions()
	character._handle_move_input()
	if character.move_direction == 0:
		character._handle_deacceleration()
	character._apply_movement()
	if character.is_on_floor():
		if character.move_direction != 0:
			emit_signal("finished", "walk")
		else:
			emit_signal("finished", "idle")
