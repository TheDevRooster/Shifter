extends Level

@onready var door_1: doorway = $Door1
var door2
@onready var scientist: CharacterBody2D = $Scientist
@export var door_1_position: Vector2i
@export var door_2_position: Vector2i
signal talked_to_scientist(dialogue)
		
		
func _ready():
	super()
	connect_consoles()
	if WorldData.talked_to_doctor_1:
		open_door(door_1_position,door_1)
	if WorldData.level_one_done:
		open_door(door_2_position, door2)
	if self.is_connected('talked_to_scientist',get_parent().get_parent().on_talked_to_scientist):
		pass
	else:
		self.connect('talked_to_scientist', get_parent().get_parent().on_talked_to_scientist)
	
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_interactable_zone_scientist_interacted_with(script) -> void:
	if DialogueDB.Dialogue_active:
		print("Dialogue is active. Evading Script")
		return
		
	print("I MADE IT PAST DIALOGUE ACTIVE")
	if DialogueDB.just_opened:
		DialogueDB.just_opened = false
		return
	
	else:
		if !WorldData.console_unlocked:
			print("instance 1")
			WorldData.console_unlocked = true
			talked_to_scientist.emit(DialogueDB.Dialogue.Scientist.Intro)
			scientist.current_dialogue = 'Intro2'

		elif WorldData.console_unlocked and WorldData.used_console and !WorldData.talked_to_doctor_1:
			print('instance 2')
			WorldData.talked_to_doctor_1 = true
			open_door(door_1_position, door_1)
			talked_to_scientist.emit(DialogueDB.Dialogue.Scientist.Intro3)
			
		elif WorldData.level_one_done:
			print("middle 1")
			talked_to_scientist.emit(DialogueDB.Dialogue.Scientist.Middle1)
			
		else:
			print("final instance")
			talked_to_scientist.emit(DialogueDB.Dialogue.Scientist.Intro4)
		
	
func open_door(door_position: Vector2i, door: doorway):
	set_cell(door_position, 0, Vector2i(7,0))
	door.monitoring = true
		
func connect_consoles():
	var gameplay = get_node('/root/Gameplay')
	for item in get_tree().get_nodes_in_group("Consoles"):
	#	print(item, ' is connecting')
		item.connect("console_interacted", gameplay.console_interacted)
		
