extends Node

@export var module_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	# Player gets a vessel ie one module lol
	var module = module_scene.instantiate()
	add_child(module)
	$ViewCamera.reparent(module)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
