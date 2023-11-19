class_name TestBody extends RigidBody2D

func _ready():
	var collision = CollisionPolygon2D.new()
	collision.polygon = $Polygon2D.polygon
	add_child(collision)
