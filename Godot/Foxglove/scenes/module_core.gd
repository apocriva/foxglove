# The purpose of the Core is primarily to relay messages
# to the attached modules. "Attached" means "child of".

# So what is really going on here...? What are the messages
# we're relaying???

extends RigidBody2D

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed("up"):
		pass
