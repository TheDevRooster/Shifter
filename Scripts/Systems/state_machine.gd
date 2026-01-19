class_name StateMachine
extends Node

@export var debug: bool
@export var player: CharacterBody2D
@export var current_state: State
var next_state: State
var states: Dictionary = {}
var player_can_attack: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_changed.connect(on_state_changed)
			#child.animation_change.connect(get_parent().on_animation_change)
			##STATE HAS TO HAVE A PLAYER VARIABLE IDK HOW THE FUCK TO CHECK A VARIABLE
			if !child.player:
				child.player = player as Player
	if debug:
		print(states)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if current_state:
		current_state.Update(delta)
	
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.Physics_Update(delta)
		



func on_state_changed(state, new_state):
	if !new_state:
		return
	var goal_state = states.get(new_state.to_lower())
	print(goal_state)
	if !new_state:
		return
	if state:
		state.Exit()
		
	goal_state.Enter()
	current_state = goal_state
	
	
func _on_player_player_attacked(attack: Variant) -> void:
	if player_can_attack:
		on_state_changed(current_state, "attack")
		
