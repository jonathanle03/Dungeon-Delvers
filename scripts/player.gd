extends CharacterBody2D

@export var speed : int
@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	direction = direction.normalized()
	
	if direction != Vector2.ZERO:
		animated_sprite.play("run")
		if direction.x > 0:
			animated_sprite.flip_h = false
		if direction.x < 0:
			animated_sprite.flip_h = true
	else:
		animated_sprite.play("idle")
	
	velocity = direction * speed * delta
	move_and_slide()
