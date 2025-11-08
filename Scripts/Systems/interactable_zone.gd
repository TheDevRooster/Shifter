class_name interact_zone

extends Area2D

signal interacted

@export var player_interactable:bool

var interaction_function = saved_interaction

func saved_interaction():
	print("hi")