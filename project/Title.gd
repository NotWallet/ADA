extends Control


@onready var Player = get_node("/root/Main/Player/")
@onready var PlayerCamera = get_node("/root/Main/Player/Camera/")
# Called when the node enters the scene tree for the first time.
func _ready():
		$StartCamera.make_current()		
		PlayerCamera.enabled = true
		pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	self.visible = false
	PlayerCamera.position = Player.position + Vector2(0,-300)
	PlayerCamera.make_current()
	$StartCamera.enabled = false
	
	
	
	
	pass # Replace with function body.
