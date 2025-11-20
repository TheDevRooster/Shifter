extends Control


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var just_opened = false

func _process(_delta: float) -> void:
	if just_opened:
		just_opened = false
		return
	if visible and Input.is_action_just_pressed("player_interact"):
		close()

		
func open():
	just_opened = true
	self.show()

func close():
	self.hide()
	get_tree().paused = false
