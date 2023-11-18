extends Node

@export var thruster_scene: PackedScene
@export var player_core_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	var player_core_module = player_core_scene.instantiate()
	player_core_module.position = Vector2.ZERO
	player_core_module.rotation = PI
	add_child(player_core_module)
	$ViewCamera.position = player_core_module.position
	$ViewCamera.reparent(player_core_module, false)

	var module_thruster = thruster_scene.instantiate()
	module_thruster.position = Vector2(45, 0)
	module_thruster.rotation = PI
	add_child(module_thruster)

	player_core_module.attach(module_thruster)
