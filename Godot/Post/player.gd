extends CharacterBody3D

@export var look_lerp_strength:float
@export var speed:float

var _target_rotation:float

func _ready():
	_target_rotation = rotation_degrees.y

func _process(_delta):
	var input_vector = Vector3.ZERO

	if Input.is_action_pressed("foot_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("foot_right"):
		input_vector.x += 1
	if Input.is_action_pressed("foot_up"):
		input_vector.z -= 1
	if Input.is_action_pressed("foot_down"):
		input_vector.z += 1

	input_vector = input_vector.normalized()
	if input_vector.length_squared() > 0:
		_target_rotation = -input_vector.signed_angle_to(Vector3.FORWARD, Vector3.UP)
		velocity = input_vector * speed
		move_and_slide()

	rotation.y = lerp_angle(rotation.y, _target_rotation, look_lerp_strength * _delta)
