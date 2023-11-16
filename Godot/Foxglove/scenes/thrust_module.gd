extends Module

func _process(delta):
	var force = Vector2.ZERO
	if Input.is_action_pressed("up"):
		force.y += 250

	apply_central_force(force.rotated(rotation))
