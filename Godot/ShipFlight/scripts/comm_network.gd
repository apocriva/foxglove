class_name CommNetwork extends Node

var _channels:Dictionary # id:String -> CommChannel

func join_channel(chid:String, member, signal_callback = null):
	var channel:CommChannel = _channels.get(chid)
	if channel == null:
		channel = CommChannel.new(chid)
		_channels[chid] = channel
	channel.add_member(member, signal_callback)
	return channel

func leave_channel(chid:String, member, signal_callback = null):
	var channel:CommChannel = _channels[chid]
	assert(channel != null)
	channel.remove_member(member, signal_callback)

func _init(_name:String = "Unnamed CommNetwork"):
	name = _name
