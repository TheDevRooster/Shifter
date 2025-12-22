extends Sprite2D
class_name TerminalPhaseOption

@export var phase_contents: Resource
var home_position: Vector2
var is_dragging = false
var delay = 10



func _ready() -> void:
	home_position = position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#print("position: ", position)
	#print("global_position:", global_position)
	#print("home_position: ", home_position)
	if is_dragging:
		#print(home_position)
		#print("sprite position: ", global_position)
		#print("mouse position", get_global_mouse_position())
		global_position = global_position.lerp(get_global_mouse_position(), .2)
	else:
		position = position.lerp(home_position, .2)
		
		
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			if get_rect().has_point(to_local(event.position)):
				is_dragging = true
		else:
			is_dragging = false
			
	
	
func change_home(new_position):
	home_position = new_position


func _on_slot_1_image_change_option_home(node: Variant) -> void:
	
	change_home(to_local(node.get_parent().global_position))
