extends Area2D

onready var fire_position = $FirePosition
onready var fire_timer = $FireTimer
signal hit

export (PackedScene) var projectile_scene

var player
var projectile_container
var target:Node2D

func _ready():
	fire_timer.connect("timeout", self, "fire_at_player")

func initialize(container, turret_pos, projectile_container):
	container.add_child(self)
	global_position = turret_pos
	self.projectile_container = projectile_container
	
func _physics_process(delta):
	if target != null:
		var space_state = get_world_2d().direct_space_state
		var result = space_state.intersect_ray(global_position, target.global_position,
							[self, target], collision_mask)
		if !result.empty() && !fire_timer.is_stopped():
			fire_timer.stop()
		elif result.empty() && fire_timer.is_stopped():
			fire_timer.start()
		
							
func fire_at_player():
	var proj_instance = projectile_scene.instance()
	proj_instance.initialize(projectile_container, fire_position.global_position, fire_position.global_position.direction_to(target.global_position))


func _on_DetectionArea_body_entered(body):
	if target == null:
		target = body
		fire_timer.start()


func _on_DetectionArea_body_exited(body):
	if body == target:
		target = null
		fire_timer.stop()


func _on_Turret_area_entered(area):
	queue_free()
	emit_signal("hit")
