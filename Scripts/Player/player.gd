class_name Player
extends CharacterBody2D

@onready var interact_area: Area2D = $InteractZone
@onready var interact_icon: Sprite2D = $InteractNotification
@onready var attack_box: Area2D = $AttackBox
@export var SPEED :float = 300.0
var health = 100
var can_interact = false
var current_interaction_function
func _physics_process(_delta: float) -> void:

	#### Start of player Movement ####

	# Handles horizontal Movement of player
	var horizontal_direction := Input.get_axis("player_move_left", "player_move_right")
	if horizontal_direction:
		#handles horiztonal rotation of interaction_zone to always be in front of the player
		if horizontal_direction > 0:
			interact_area.rotation_degrees = 0
			attack_box.rotation_degrees = 0
		elif horizontal_direction < 0:
			interact_area.rotation_degrees = 180
			attack_box.rotation_degrees = 180
		velocity.x = horizontal_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#Handles vertical Movement of player
	var vertical_direction := Input.get_axis("player_move_up", "player_move_down")
	if vertical_direction:
		if vertical_direction > 0 : 
			interact_area.rotation_degrees = 90
			attack_box.rotation_degrees = 90
		elif vertical_direction < 0:  
			interact_area.rotation_degrees = 270
			attack_box.rotation_degrees = 270
		velocity.y = vertical_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()

	#### End of player Movement ####

	#### Start of player Inputs ####
	# All player inputs are handled via project input and then written in functions below.

	if Input.is_action_just_pressed("player_ability_1"):
		ability_1()
	if Input.is_action_just_pressed("player_ability_2"):
		ability_2()
	if Input.is_action_just_pressed("player_interact") and can_interact:
		print("Interacted")

	#### End of player Inputs ####

func ability_1():

	attack_box.show()
	await get_tree().create_timer(.3).timeout
	attack_box.hide()

func ability_2():
	print("woa")


func _on_interact_zone_area_entered(area: Area2D) -> void:
	if area is interact_zone:
		if area.player_interactable:
			current_interaction_function = area.interaction_function
			if !can_interact:
				can_interact = true
				interact_icon.show()
	else:
		pass


func _on_interact_zone_area_exited(area: Area2D) -> void:
	if area is interact_zone:
		if area.player_interactable:
			current_interaction_function = null
			can_interact = false
			interact_icon.hide()
	else:
		pass
		
