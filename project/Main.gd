extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_kill_zone_area_entered(area):
	pass


func _on_kill_zone_body_entered(body):
		if body.name == "Player":
			$Player.position = $Respawn.position
