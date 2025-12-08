extends State

var player: CharacterBody2D

func Enter():
	#Play Animation
	pass
	
func Update(_delta: float):
	var direction := Input.get_vector("player_move_left", "player_move_right", "player_move_up", "player_move_down")
	if direction:
		state_changed.emit(self, "Moving")
		
