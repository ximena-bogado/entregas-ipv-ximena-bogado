extends AbstractState


func enter() -> void:
	character._play_animation("idle")


func handle_input(event:InputEvent) -> void:
	if event.is_action_pressed("jump") && character.is_on_floor():
		emit_signal("finished", "jump")


func update(delta:float) -> void:
	character._handle_cannon_actions()
	character._handle_move_input()
	if character.move_direction != 0:
		emit_signal("finished", "walk")
	else:
		character._handle_deacceleration()
		character._apply_movement()
		if character.is_on_floor():
			character._play_animation("idle")
		else:
			emit_signal("finished", "jump")


func handle_event(event: String, value = null) -> void:
	match event:
		"hit":
			character._handle_hit(value)
			if character.current_hp <= 0:
				emit_signal("finished", "dead")
		"healed":
			character._handle_heal(value)
