class_name Connector extends Node2D

var _my_rigidbody:RigidBody2D
var _target:RigidBody2D

func connect_to(new_target:RigidBody2D):
	if _target == null:
		# Remove old target
		pass
	_target = new_target
	_target.freeze = true
	_target.reparent(_my_rigidbody)
	_target.position = position
	for shape in _target.get_collision_shapes():
		var new_node = shape.duplicate()
		shape.disabled = true
		new_node.position = position
		_my_rigidbody.add_child(new_node)

func _enter_tree():
	assert(get_parent() is RigidBody2D)
	_my_rigidbody = get_parent()
