# Thruster thrusts when signal is active.

extends Module

@export var thruster_force:Vector2
var active_force:Vector2 = Vector2.ZERO

var _channel_forward:CommChannel

func _on_signal_updated(value):
	if value == 0:
		active_force = Vector2.ZERO
	else:
		active_force = thruster_force

func _physics_process(_delta):
	apply_central_force(active_force.rotated(global_rotation))

func _join_channels():
	_channel_forward = comm_network.join_channel("forward", self, _on_signal_updated)

func _leave_channels():
	if comm_network == null:
		return
	comm_network.leave_channel("forward", self, _on_signal_updated)
