extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var frameThrust = Vector2.ZERO
	var frameTorque = 0
	
	if Input.is_action_pressed("up"):
		frameThrust = Vector2.UP * 500
	
	if Input.is_action_pressed("left"):
		frameTorque -= 3600
	if Input.is_action_pressed("right"):
		frameTorque += 3600
	
	apply_central_force(frameThrust.rotated(rotation))
	apply_torque(frameTorque)
