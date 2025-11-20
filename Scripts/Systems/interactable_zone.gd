class_name InteractZone
extends Area2D



@export var player_interactable:bool

func _ready() -> void:
	add_to_group("Consoles")

func interaction():
	print("configure 'func interaction():'")
