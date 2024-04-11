extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var isHit = velocity.y<1 and velocity.y>-1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"
	if is_on_floor():
		sprite_2d.animation = "default"
	
		
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$SoundJump.play()
	if Input.is_action_just_pressed("ui_accept") and not is_on_floor():
		velocity.y = JUMP_VELOCITY
		$SoundJump.play()

	
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 25)

	move_and_slide()
	
	var isLeft = velocity.x<0
	sprite_2d.flip_h = isLeft 
	if not is_on_floor() and isHit:
		$FallSound.play()