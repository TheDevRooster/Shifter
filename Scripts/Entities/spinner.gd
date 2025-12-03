extends CharacterBody2D

@onready var hp: Label = $HP
@onready var health_component: HealthComponent = $HealthComponent


func _process(delta: float) -> void:
	hp.text = str(health_component.current_health)
