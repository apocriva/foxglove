extends Node

@export var attract_body:RigidBody2D
@export_range(0, 1000, 10, "or_greater") var click_force:float

@onready var viewport_size = get_viewport().get_visible_rect().size

func _physics_process(delta):
	if attract_body == null:
		return

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		var mouse_position = get_viewport().get_mouse_position()
		var force_source = mouse_position - viewport_size / 2
		var force = force_source - attract_body.global_position
		attract_body.apply_central_force(force * click_force * delta)
