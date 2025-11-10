class_name interact_zone
extends Area2D



@export var player_interactable:bool
func _ready() -> void:
	add_to_group("Consoles")

func interaction():
	return "Configure Zone interaction"