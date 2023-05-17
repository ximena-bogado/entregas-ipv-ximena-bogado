extends Node2D

export (NodePath) var pathfinding: NodePath


func _ready():
	if pathfinding.is_empty():
		return
	
	var pathfinder: PathfindAstar = get_node(pathfinding)
	
	if pathfinder == null:
		return
	
	#turrent.	pathfinding = pathfinder
	for child in get_children():
		child.pathfinding = pathfinder

