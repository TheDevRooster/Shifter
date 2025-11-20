extends InteractZone

signal scientist_interacted_with(conversation)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass	

func interaction():
	scientist_interacted_with.emit()
