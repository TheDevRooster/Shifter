extends CanvasLayer
@onready var dialogue_box: Control = $Dialogue
@onready var terminal_console: Control = $TerminalConsole
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass




func start_dialogue(dialogue):
	DialogueDB.Dialogue_active = true
	dialogue_box.text.text = dialogue
	if !dialogue_box.visible:
		dialogue_box.show()
	else:
		pass
