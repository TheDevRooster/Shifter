class_name LevelManager
extends Node

signal level_change(level:PackedScene)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func on_door_entered(connected_path):
	if connected_path is PackedScene:
		level_change.emit(connected_path)
	else:
		print("hello")


		
		
