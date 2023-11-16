extends Node

@export var module_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	# Player gets a vessel ie one module lol
	var module = module_scene.instantiate()
	module.position = Vector2.ZERO
	module.rotation = PI
	add_child(module)
	$ViewCamera.position = module.position
	$ViewCamera.reparent(module, false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
