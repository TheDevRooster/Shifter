class_name Player
extends CharacterBody2D


@onready var phases: Node = $Phases
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interact_area: Area2D = $InteractZone
@onready var interact_icon: Sprite2D = $InteractNotification
@onready var animator: AnimatedSprite2D = $AnimationSprite
@export var SPEED :float = 300.0


signal interacted(target)


var can_interact = false
var current_interaction
var facing_direction = Vector2.UP
var current_phase

func _ready() -> void:
	current_phase = phases.get_child(0)
	print(current_phase)
	
	
func _physics_process(_delta: float) -> void:

	#### Start of player Movement ####

	var direction := Input.get_vector("player_move_left", "player_move_right", "player_move_up", "player_move_down")
	if direction:
		facing_direction = direction.normalized()
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

	#### End of player Movement ####


	#### Handles Movement of player interaction Box ####

	if direction.x > 0:
		interact_area.rotation_degrees = 0
	elif direction.x < 0:
		interact_area.rotation_degrees = 180
	elif direction.y > 0:
		interact_area.rotation_degrees = 90
	elif direction.y < 0:
		interact_area.rotation_degrees = 270


	####End of Movement of player interaction Box

	#### Start of player Inputs ####

	# All player inputs are handled via project input and then written in functions below.

	if Input.is_action_just_pressed("player_ability_1"):
		current_phase.attack1(facing_direction,current_phase)
	if Input.is_action_just_pressed("player_ability_2"):
		current_phase.attack2(facing_direction, current_phase)
	if Input.is_action_just_pressed("player_interact") and can_interact:
		interacted.emit(current_interaction)

	#### End of player Inputs ####


func phase_shift():
	print("shifting")
	phases.move_child(phases.get_child(0),phases.get_child_count() - 1)
	current_phase = phases.get_child(0)
	


func _on_interact_zone_area_entered(area: Area2D) -> void:
	if area is InteractZone:
		if area.player_interactable:
			if !can_interact:
				can_interact = true
				interact_icon.show()
				current_interaction = area
	else:
		pass


func _on_interact_zone_area_exited(area: Area2D) -> void:
	if area is InteractZone:
		if area.player_interactable:
			can_interact = false
			interact_icon.hide()
	else:
		pass
		


func _on_attack_component_attacked() -> void:
	#animator.play("Attack")
	pass


func _on_phase_timer_timeout() -> void:
	print(current_phase)
	phase_shift()
	



















































func make_space():
	pass
