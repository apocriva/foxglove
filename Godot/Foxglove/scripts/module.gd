# Base module contains CommNetwork functionality.

class_name Module extends RigidBody2D

var comm_network:CommNetwork:
	get:
		return comm_network
	set(value):
		_leave_channels()
		comm_network = value
		_join_channels()

func _leave_channels(): pass
func _join_channels(): pass

func _enter_tree():
	# Join this tree's comm_network. Because _enter_tree
	# is called top-down, if our parent doesn't have a
	# CommNetwork, we should probably just make one ourselves.
	var parent = get_parent()
	if parent == null or parent.get("comm_network") == null:
		comm_network = CommNetwork.new(name + " CommNetwork")
	else:
		comm_network = parent.comm_network
