extends Level

@onready var door_1: doorway = $Door1
var door2
@onready var scientist: CharacterBody2D = $Scientist
@export var door_1_position: Vector2i
@export var door_2_position: Vector2i
signal talked_to_scientist
		
		
func _ready():
	super()
	if WorldData.talked_to_doctor_1:
		open_door(door_1_position,door_1)
	if WorldData.level_one_done:
		open_door(door_2_position, door2)
	self.connect('talked_to_scientist', get_parent().get_parent().on_talked_to_scientist)
	
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_interactable_zone_scientist_interacted_with() -> void:
	if !WorldData.console_unlocked:
		WorldData.console_unlocked = true
		talked_to_scientist.emit(DialogueDB.LAB_INTRO_1)
	if !WorldData.talked_to_doctor_1:
		WorldData.talked_to_doctor_1 = true
		open_door(door_1_position, door_1)
		
		
		
func open_door(door_position: Vector2i, door: doorway):
	print("opening door")
	set_cell(door_position, 0, Vector2i(7,0))
	door.monitoring = true
		
