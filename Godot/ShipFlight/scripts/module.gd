# Base module contains CommNetwork functionality.

class_name Module extends Node2D

@export var mass:float

var comm_network:CommNetwork:
	get:
		return comm_network
	set(value):
		_leave_channels()
		comm_network = value
		_join_channels()

func get_root_module():
	var parent = get_parent()
	while(parent != null):
		var grandparent = parent.get_parent()
		if parent is Module and not grandparent is Module:
			return parent
		parent = grandparent
	return null

func get_root_rigidbody():
	var root_module = get_root_module()
	if root_module == null:
		return null
	var root_rigidbody = root_module.get_parent()
	if root_rigidbody == null:
		return null
	assert(root_rigidbody is RigidBody2D)
	return root_rigidbody

func _leave_channels(): pass
func _join_channels(): pass

var _my_shape_owner_id:int

func _init():
	print(name, " _init");

func _enter_tree():
	print(name, " _enter_tree");
	_my_shape_owner_id = -1
	var rigidbody:RigidBody2D = get_root_rigidbody()
	if rigidbody == null:
		return
	for child in get_children():
		if child is CollisionShape2D:
			if _my_shape_owner_id == -1:
				_my_shape_owner_id = rigidbody.create_shape_owner(self)
			rigidbody.shape_owner_add_shape(_my_shape_owner_id, child.shape)

func _ready():
	print(name, " _ready")
	_update_comm_network()

func _update_comm_network():
	var parent = get_parent()
	if parent != null and parent.get("comm_network") != null:
		comm_network = parent.comm_network
	else:
		comm_network = CommNetwork.new(name + " CommNetwork")
