class_name CommNetwork extends Node

var _channels:Dictionary # id:String -> CommChannel

func _init(name:String = "Unnamed CommNetwork"):
	self.name = name
	child_entered_tree.connect(_on_child_entered_tree)

func _on_child_entered_tree(node:Node):
	print("omg child")
	pass
