extends Control
@onready var text: Label = $Text
@onready var background_color: ColorRect = $BackgroundColor

var just_pressed = false
var current_conversation: Dictionary
var more_conversation = false
var current_speaker

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("player_interact"):
		if get_tree().paused:
			if current_conversation.next_text:
				progress_conversation(current_conversation.next_text)
			else:
				close_dialogue()
		else:
			pass
		

func start_dialogue(dialogue):
	DialogueDB.Dialogue_active = true
	DialogueDB.just_opened = true
	current_conversation = dialogue
	current_speaker = dialogue.speaker
	print("Starting Dialogue test from dialogue node")
	self.show()
	text.text = dialogue.text
	get_tree().paused = true		


func close_dialogue():
	DialogueDB.Dialogue_active = false
	print("closing Dialogue from dialogue Node")
	#if DialogueDB.Dialogue_active:

	self.hide()
	get_tree().paused = false

func progress_conversation(next_convo):
	current_conversation = DialogueDB.Dialogue[current_speaker][next_convo]
	print("progressing Conversation")
	text.text = DialogueDB.Dialogue[current_speaker][next_convo]['text']
	
