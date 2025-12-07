extends Control
@onready var text: Label = $Text
@onready var background_color: ColorRect = $BackgroundColor

var just_pressed = false
var current_conversation: Dictionary
var more_conversation = false
var current_speaker

func _input(event: InputEvent) -> void:
	#print(get_tree().paused)
	#print('Next text is: ',current_conversation.next_text)
	if event.is_action_pressed("player_interact"):
		print("Player interacting")
		if DialogueDB.Dialogue_active:
			print(current_conversation.next_text)
			if current_conversation.next_text:
				progress_conversation(current_conversation.next_text)
			else:
				close_dialogue()
		else:
			return
		

func start_dialogue(dialogue):
	#print("Starting Dialogue test from dialogue node")
	#print(dialogue)
	DialogueDB.Dialogue_active = true
	DialogueDB.just_opened = true
	get_tree().paused = true
	current_conversation = dialogue
	current_speaker = dialogue.speaker
	self.show()
	text.text = dialogue.text


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
	
