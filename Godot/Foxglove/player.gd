extends Area2D

signal hit

@export var speed = 400	# How fast the player moves (px/sec)
var screen_size			# Size of game window.

func _ready():
	screen_size = get_viewport_rect().size
	hide()

func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	select_animation(velocity)

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

func start(startPosition):
	position = startPosition
	show()
	$CollisionShape2D.disabled = false

func select_animation(velocity):
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
		if velocity.x != 0:
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_v = false
			$AnimatedSprite2D.flip_h = (velocity.x < 0)
		elif velocity.y != 0:
			$AnimatedSprite2D.animation = "up"
			$AnimatedSprite2D.flip_v = (velocity.y > 0)
	else:
		$AnimatedSprite2D.stop()

func _on_body_entered(body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
