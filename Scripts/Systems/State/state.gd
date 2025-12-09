class_name State
extends Node

signal state_changed(state, new_state)
var player




func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	



func Enter():
	pass

func Exit():
	pass	

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass
