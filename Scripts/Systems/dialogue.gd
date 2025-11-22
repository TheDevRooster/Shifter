extends Control
@onready var text: Label = $Text
@onready var background_color: ColorRect = $BackgroundColor

var just_pressed = false

func _input(event: InputEvent) -> void:
	print("Dialogue Running")
	if event.is_action_pressed("player_interact") and DialogueDB.Dialogue_active:
		close_dialogue()
		

func close_dialogue():
	print("closing Dialogue")
	#if DialogueDB.Dialogue_active:
	self.hide()
	get_tree().paused = false
	just_pressed = false
