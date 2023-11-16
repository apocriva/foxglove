class_name CommChannel extends Object

signal signal_updated(value)

var name:String
var last_value

func set_signal(value):
	if value != last_value:
		signal_updated.emit(value)
	last_value = value;
