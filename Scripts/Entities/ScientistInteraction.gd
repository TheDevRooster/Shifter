class_name ScientistInteractionZone
extends InteractZone

signal scientist_interacted_with(conversation)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass	

func interaction():
	print("emmiting scientist interacted with Signal")
	scientist_interacted_with.emit(get_parent().current_dialogue)
	
