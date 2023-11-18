# Base module contains CommNetwork functionality.

class_name Module extends RigidBody2D

var comm_network:CommNetwork:
	get:
		return comm_network
	set(value):
		_leave_channels()
		comm_network = value
		_join_channels()
		# Propagate to children.
		for module in _attach_modules:
			module.set_comm_network(value)

func _leave_channels(): pass
func _join_channels(): pass

var _attach_modules:Array[Module]

var _attach_parent:Module
var _attach_offset:Vector2
var _attach_rotation:float

func attach(module:Module):
	assert(module != null)
	assert(!_attach_modules.has(module))
	_attach_modules.push_back(module)
	module._on_attachment_changed(self)
	module.reparent(self)

func separate():
	assert(_attach_parent != null)
	_on_attachment_changed(null)

func _ready():
	_update_comm_network()

func _on_attachment_changed(parent:Module):
	_attach_parent = parent
	if parent != null:
		_attach_offset = global_position - parent.global_position
		_attach_rotation = global_rotation - parent.global_rotation
	_update_comm_network()
	_update_attachment_physics()

func _update_comm_network():
	if _attach_parent != null and _attach_parent.get("comm_network") != null:
		self.comm_network = _attach_parent.comm_network
	else:
		self.comm_network = CommNetwork.new(name + " CommNetwork")

func _update_attachment_physics():
	# If we are attached to a parent, we now do special
	# physics things...?
	if _attach_parent == null:
		pass
	else:
		pass
