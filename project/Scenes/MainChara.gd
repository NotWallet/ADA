extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var sprite_2d = $Sprite2D
@onready var Cam = get_node("/root/Main/Cam/")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var isHit = velocity.y<1 and velocity.y>-1

var Jumps = 2
var CanDash = true
var Health = 3
var facing
var face = 1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"
	if is_on_floor():
		sprite_2d.animation = "default"
		Jumps = 2
		get_tree().create_timer(0.4)
		CanDash = true
		
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and Jumps != 0:
		Jumps = Jumps - 1
		print(Jumps)
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
	
	facing = velocity.x<0
	if velocity.x != 0:
		if facing == true:
			face = -1
		else:
			face = 1
	sprite_2d.flip_h = facing
	
	

		
		
func TakeDamage(amount):
	Health -= amount
	if Health < 0:
		#end game
		pass
		
		
func Dash():
	CanDash = false
	velocity.x += 1000 * face
	pass
	
		






