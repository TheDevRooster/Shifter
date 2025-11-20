class_name doorway
extends InteractZone

signal door_entered(area: String)

@export var connected_area: String
@export var connected_area_spawn: Vector2

func _ready():
	if not self.is_connected("body_entered", _on_body_entered):
		self.connect('body_entered', _on_body_entered)



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		door_entered.emit(load(connected_area) as PackedScene)
		
