class_name Enemy
extends CharacterBody2D

@onready var hp: Label = $HP
@onready var health_component: HealthComponent = $HealthComponent

@export var attack_damage:= 5
@export var knockback:= 30
@export var recoil:= 100

func _process(_delta: float) -> void:
	hp.text = str(health_component.current_health)
	

func _physics_process(delta: float) -> void:
	move_and_slide()
