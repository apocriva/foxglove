extends Node2D

@export var spring_color:Color
@export_range(0.1, 10, 0.1) var spring_attach_size:float
@export_range(0.1, 10, 0.1) var spring_width:float

var _joints_data:Array[Dictionary]
@export var _rigidbodies:Array[RigidBody2D]

func _ready():
	_update_joints()

func _physics_process(_delta):
	queue_redraw()

func _update_joints():
	_register_joints(get_tree().root)

func _register_joints(node):
	if node.is_class("DampedSpringJoint2D"):
		var offset_endpoint = Vector2(0, node.rest_length).rotated(node.global_rotation)
		var spring_endpoint = node.global_position + offset_endpoint
		var type = "DampedSpringJoint2D"
		var offset_a = node.global_position - node.get_node(node.node_a).global_position
		var offset_b = node.global_position + offset_endpoint - node.get_node(node.node_b).global_position
		var joint_data = {
			"type": type,
			"joint": node,
			"offset_endpoint": offset_endpoint,
			"offset_a": offset_a,
			"offset_b": offset_b
		}
		_joints_data.push_back(joint_data)
	for child in node.get_children():
		_register_joints(child)

func _draw():
	for item in _joints_data:
		_draw_joint(item)
	for item in _rigidbodies:
		_draw_com(item)

func _draw_joint(item:Dictionary):
	var joint = item["joint"]
	var node_a = joint.get_node(joint.node_a)
	var node_b = joint.get_node(joint.node_b)
	var offset_endpoint = item["offset_endpoint"]
	var offset_a = item["offset_a"]
	var offset_b = item["offset_b"]
	var spring_start = node_a.global_position + offset_a.rotated(node_a.global_rotation)
	var spring_end = node_b.global_position + offset_b.rotated(node_b.global_rotation)
	draw_circle(spring_start, spring_attach_size, spring_color)
	draw_circle(spring_end, spring_attach_size, spring_color)
	draw_line(spring_start, spring_end, spring_color, spring_width)

func _draw_com(item:RigidBody2D):
	draw_circle(item.global_position, 5, Color.BLUE)
