class_name ModulePlayerCore extends Module

var _channel_forward:CommChannel

func _process(_delta):
	var signal_strength = 0
	if Input.is_action_pressed("up"):
		signal_strength = 1
	_channel_forward.set_signal(signal_strength)

func _join_channels():
	_channel_forward = comm_network.join_channel("forward", self)

func _leave_channels():
	if comm_network == null:
		return
	_channel_forward.remove_member(self)
