# Thruster thrusts when signal is active.

extends RigidBody2D

@export var thruster_force:Vector2
var active_force:Vector2 = Vector2.ZERO

var channel:CommChannel

func _ready():
	register_signals()

func register_signals():
	# Tune in to the proper channel.
	#channel.signal_updated.connect(_on_signal_updated)
	pass

func _on_signal_updated(value):
	if value == 0:
		active_force = Vector2.ZERO
	else:
		active_force = thruster_force

func _physics_process(delta):
	apply_central_force(active_force.rotated(rotation))
