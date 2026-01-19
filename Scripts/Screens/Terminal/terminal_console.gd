extends Control


var just_opened = false
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("player_interact"):
		close()

func open():
	if DialogueDB.Dialogue_active:
		return
	just_opened = true
	self.show()
	WorldData.used_console = true

func close():
	if DialogueDB.Dialogue_active:
		return
	self.hide()
	get_tree().paused = false
