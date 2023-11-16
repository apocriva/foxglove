# Thruster thrusts when signal is active.

extends RigidBody2D

@export var thruster_force:Vector2
var active_force:Vector2 = Vector2.ZERO

var comm_network:CommNetwork

func _ready():
	_update_comm_network()

func _on_signal_updated(value):
	if value == 0:
		active_force = Vector2.ZERO
	else:
		active_force = thruster_force

func _physics_process(delta):
	apply_central_force(active_force.rotated(rotation))

func _update_comm_network():
	# We need to join our parent's comm network.
	var parent = get_parent()
	if parent == null or parent.get("comm_network") == null:
		# Or make our own I guess!
		comm_network = CommNetwork.new()
		add_child(comm_network)
