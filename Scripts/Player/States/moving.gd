extends State



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
		change_direction("Moving_Right")
	elif direction.x < 0:
		player.interact_area.rotation_degrees = 180
		change_direction("Moving_Left")
	elif direction.y > 0:
		player.interact_area.rotation_degrees = 90
		change_direction("Moving_Down")
	elif direction.y < 0:
		player.interact_area.rotation_degrees = 270
		change_direction("Moving_Up")


func change_direction(direction:String):
	var current_frame = player.animator.get_frame()
	var current_frame_progress = player.animator.get_frame_progress()
	player.animator.set_frame_and_progress(current_frame, current_frame_progress)
	player.animator.play(direction)
