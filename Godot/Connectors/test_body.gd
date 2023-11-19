class_name TestBody extends RigidBody2D

@onready var _base_mass = mass
var _collision_shapes:Array[CollisionShape2D]

func get_collision_shapes() -> Array[CollisionShape2D]:
	return _collision_shapes

func _ready():
	var shape = CollisionShape2D.new()
	shape.set_shape(ConvexPolygonShape2D.new())
	shape.shape.set_point_cloud($Polygon2D.polygon)
	add_child(shape)
	_collision_shapes.push_back(shape)


func _on_child_entered_tree(node):
	if not node is RigidBody2D:
		return
	mass += node.mass
	center_of_mass += (node.position * node.mass) / 2
