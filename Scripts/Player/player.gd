extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var horizontal_direction := Input.get_axis("player_move_left", "player_move_right")
	if horizontal_direction:
		velocity.x = horizontal_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var vertical_direction := Input.get_axis("player_move_up", "player_move_down")
	if vertical_direction:
		velocity.y = vertical_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
	if Input.is_action_just_pressed("player_ability_1"):
		ability_1()
	if Input.is_action_just_pressed("player_ability_2"):
		ability_2()


func ability_1():
	print("woo")

func ability_2():
	print("woa")

