extends State

var player

func Update(_delta: float):
	var direction := Input.get_vector("player_move_left", "player_move_right", "player_move_up", "player_move_down")
	if !direction:
		state_changed.emit(self,"idle")
	if direction:
		player.facing_direction = direction.normalized()
		player.velocity = direction * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		player.velocity.y = move_toward(player.velocity.y, 0, player.SPEED)

	player.move_and_slide()
	
	if direction.x > 0:
		player.interact_area.rotation_degrees = 0
	elif direction.x < 0:
		player.interact_area.rotation_degrees = 180
	elif direction.y > 0:
		player.interact_area.rotation_degrees = 90
	elif direction.y < 0:
		player.interact_area.rotation_degrees = 270
