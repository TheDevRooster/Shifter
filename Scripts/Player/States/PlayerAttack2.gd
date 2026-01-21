extends State




func Enter():
	player.current_phase.attack2(player.facing_direction)
	await player.current_phase.attack_finished
	state_changed.emit(self, "idle")
	
