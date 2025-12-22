extends Sprite2D
class_name TerminalPhaseSlot

@onready var area_2d: Area2D = $Area2D


signal change_option_home(node)
var droppable = false
var potential_phase
@export var slot_position: Vector2



func _process(delta: float) -> void:
	#print("SLOT position", global_position)
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_released():
			if get_rect().has_point(to_local(event.position)):
				print("Boop")
				
