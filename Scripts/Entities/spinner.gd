class_name Enemy
extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var state: Label = $State
@onready var health_component: HealthComponent = $HealthComponent
@onready var state_machine: StateMachine = $StateMachine
@export var attack_damage:= 5
@export var knockback:= 30
@export var recoil:= 100

func _process(_delta: float) -> void:
	state.text = str(state_machine.current_state)
	

func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_health_component_died() -> void:
	state_machine.on_state_changed(state_machine.current_state, 'death')
