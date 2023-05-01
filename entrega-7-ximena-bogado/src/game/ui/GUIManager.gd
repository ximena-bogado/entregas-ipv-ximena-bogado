extends Control

## Gotta display the hp here. To communicate with the Player node to handle the data, you can either
## capture some "hit"/"hp_changed" signal via Level, or you can use Autoload/Singletons.
## Remember to refresh the data if you restart the level.

export var heart_bar_path: NodePath

func change_heart_bar() -> void:
	var heart_bar: Range = get_node(heart_bar_path)
	heart_bar.value -= 25
