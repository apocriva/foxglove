class_name CommChannel extends Object

signal comm_signal_updated(value)
var id:String

var _last_value
var _members:Array

func add_member(member, signal_callback = null):
	assert(!_members.has(member))
	_members.push_back(member)

	if signal_callback != null:
		assert(!comm_signal_updated.is_connected(signal_callback))
		comm_signal_updated.connect(signal_callback)

func remove_member(member, signal_callback = null):
	assert(_members.has(member))
	_members.erase(member)

	if signal_callback != null:
		assert(comm_signal_updated.is_connected(signal_callback))
		comm_signal_updated.disconnect(signal_callback)

func _init(_id:String):
	id = _id

func set_signal(value):
	if value != _last_value:
		comm_signal_updated.emit(value)
	_last_value = value;
