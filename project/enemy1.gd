extends CharacterBody2D


var SPEED = 2000

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction = 1


func _physics_process(delta):
	# Apply gravity
	velocity.y += gravity * delta

	# Move horizontally
	velocity.x = SPEED * direction * delta
	move_and_slide()

	if is_on_wall():
		direction *= -1
		





func _on_stomp_body_entered(body):
	print(body.name)
	if body.name == "Player":
		self.queue_free()
