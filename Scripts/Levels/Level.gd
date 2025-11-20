class_name Level
extends TileMapLayer


signal level_complete(level_number)


@export var spawnpoint: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent().has_method('on_door_entered') and not get_parent().is_connected("on_door_entered",get_parent().on_door_entered):
		for door in get_tree().get_nodes_in_group("door"):
			door.connect("door_entered", get_parent().on_door_entered)
	
