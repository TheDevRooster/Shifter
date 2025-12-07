class_name HitboxComponent
extends Area2D

signal entity_hit

@export var health_component: HealthComponent

func damage(amount):
	if health_component:
		health_component.take_damage(amount)
		entity_hit.emit()
