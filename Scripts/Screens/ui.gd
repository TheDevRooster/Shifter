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
	print("starting Dialogue from UI")
	dialogue_box.text.text = dialogue
	dialogue_box.show()
	get_tree().paused = true
	
