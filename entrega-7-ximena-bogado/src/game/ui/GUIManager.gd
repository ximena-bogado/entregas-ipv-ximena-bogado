extends Control

## Gotta display the hp here. To communicate with the Player node to handle the data, you can either
## capture some "hit"/"hp_changed" signal via Level, or you can use Autoload/Singletons.
## Remember to refresh the data if you restart the level.

signal player_died

export var heart_bar_path: NodePath
onready var heart_bar: Range = get_node(heart_bar_path)

func change_heart_bar() -> void:
	heart_bar.value -= 25
	if (heart_bar.value == 0):
		emit_signal("player_died")
		
		
func restart_heart_bar() -> void:
	heart_bar.value = 100
