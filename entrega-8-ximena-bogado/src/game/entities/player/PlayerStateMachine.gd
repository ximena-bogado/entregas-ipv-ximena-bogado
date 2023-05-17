extends AbstractStateMachine


func _ready() -> void:
	states_map = {
		"idle": $Idle,
		"walk": $Walk,
		"jump": $Jump,
		"dead": $Dead,
	}


func notify_hit(amount: int) -> void:
	current_state.handle_event("hit", amount)
	if character.current_hp == 0:
		_change_state("dead")


func notify_healed(amount: int) -> void:
	current_state.handle_event("healed", amount)
