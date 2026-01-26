extends State







func Enter():
	player.current_phase.attack1(player.facing_direction)
	player.animator.play("attack1")
	await player.current_phase.attack_finished
	state_changed.emit(self, "idle")
	
	
func Exit():
	pass
