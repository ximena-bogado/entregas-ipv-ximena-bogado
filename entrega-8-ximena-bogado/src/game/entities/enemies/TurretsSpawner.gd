extends Control

export (PackedScene) var turret_scene
export (NodePath) var pathfinding: NodePath

func _ready():
	_initialize()
	if pathfinding.is_empty():
		return
	
	var pathfinder: PathfindAstar = get_node(pathfinding)
	
	if pathfinder == null:
		return
	
	for child in get_children():
		child.pathfinding = pathfinder
	

func _initialize():
	for i in 3:
		var turret_instance = turret_scene.instance()
		
		var turret_pos:Vector2 = Vector2(
			rand_range(rect_position.x, rect_position.x + rect_size.x),
			rand_range(rect_position.y, rect_position.y + rect_size.y)
			)
		
		turret_instance.initialize(self, turret_pos, self)
		self.add_child(turret_instance)
