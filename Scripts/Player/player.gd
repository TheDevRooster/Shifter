class_name Player
extends CharacterBody2D


signal on_hit()

@onready var current_state: Label = $CurrentState
@onready var player_hitbox: HitboxComponent = $HitboxComponent
@onready var player_collision_box: CollisionShape2D = $CollisionShape2D
@onready var state_machine: StateMachine = $StateMachine
@onready var phases: Node = $Phases
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var interact_area: Area2D = $InteractZone
@onready var interact_icon: Sprite2D = $InteractNotification
@onready var animator: AnimatedSprite2D = $AnimationSprite
@export var SPEED :float = 300.0
@export var debug: bool
var just_hit = false

signal interacted(target)
signal player_attacked(attack)
var can_interact = false
var current_interaction
var facing_direction = Vector2.UP
var current_phase

func _ready() -> void:
	current_phase = phases.get_child(0)
	if debug:
		current_state.show()
	


	
func _physics_process(_delta: float) -> void:
	if debug:
		current_state.text = str(state_machine.current_state)
	# All player inputs are handled via project input and then written in functions below.
	if Input.is_action_just_pressed("player_ability_1"):
		player_attacked.emit("attack1")
	if Input.is_action_just_pressed("player_ability_2"):
		player_attacked.emit("attack2")
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
				#print(current_interaction)
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
	print("shifting")
	phase_shift()
	#print(current_phase)
	

func _on_hitbox_component_entity_hit() -> void:
	just_hit = true


func _on_on_hit() -> void:
	if just_hit:
		return
	state_machine.on_state_changed(state_machine.current_state, 'knockback')
