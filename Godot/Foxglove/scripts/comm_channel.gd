class_name CommChannel extends Object

signal comm_signal_updated(value)
var id:String

var _last_value

func _init(id:String):
	self.id = id

func set_signal(value):
	if value != _last_value:
		comm_signal_updated.emit(value)
	_last_value = value;
