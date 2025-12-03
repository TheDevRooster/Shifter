extends CanvasLayer
@onready var dialogue_box: Control = $Dialogue
@onready var terminal_console: Control = $TerminalConsole
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#print("running")
	pass



func start_dialogue(dialogue):
	dialogue_box.start_dialogue(dialogue)

func accessed_terminal():
	terminal_console.open()
