extends Module

func _process(delta):
	var force = Vector2.ZERO
	if Input.is_action_pressed("up"):
		force.y += 100
	apply_central_force(force)
