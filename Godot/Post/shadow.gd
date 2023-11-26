extends Node3D

@export var target:Node3D

func _physics_process(_delta):
	if target == null:
		return

	global_position = target.global_position
	global_position.y = 0
