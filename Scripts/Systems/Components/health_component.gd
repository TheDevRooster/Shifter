class_name HealthComponent

extends Node


#@export var healthStats: Resource
@export var health:int
var max_health
var current_health

signal died
signal hit
signal healed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_parent().has_method("on_died"):
		print("connected on_died")
		connect("died", get_parent().on_died)
		
	max_health = health
	current_health = max_health




func take_damage(damage_amount):
	if current_health - damage_amount <= 0:
		get_parent().queue_free()
		died.emit()
	print("test")
	hit.emit()
	current_health -= damage_amount
	print(current_health)

func heal_damage(amount):
	healed.emit()
	if current_health + amount > max_health:
		current_health = max_health
	else:
		current_health += amount
