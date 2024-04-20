extends CharacterBody2D


var SPEED = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	position.y += SPEED
	if position.y > 100:
		SPEED -= 1
	if position.y <= 0:
		SPEED += 1
	
	move_and_slide()




func _on_area_2d_body_entered(body):
	if body.name == "Player":
		self.queue
