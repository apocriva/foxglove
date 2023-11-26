extends Node3D

@export var look_target:Node3D
@export var lerp_strength:float
@export var lerp_snap:float

func _process(_delta):
	if look_target == null:
		return

	var target_delta = look_target.global_position - global_position
	if target_delta.length_squared() < lerp_snap:
		global_position = look_target.global_position
		return

	global_position += target_delta * lerp_strength * _delta
