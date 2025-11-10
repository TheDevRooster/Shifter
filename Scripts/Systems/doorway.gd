class_name doorway
extends interact_zone

signal level_change

@export var connected_area: PackedScene



func on_interacted():
	level_change.emit()	
