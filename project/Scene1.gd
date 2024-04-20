extends Node2D

var enemy1_scene =preload("res://enemy1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_Timer_timeout():
	var enemy1 = enemy1_scene.instance()
	add_child(enemy1)
	
