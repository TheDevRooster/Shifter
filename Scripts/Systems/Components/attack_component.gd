class_name AttackComponent
extends Node

@onready var cooldown: Timer = $Cooldown
@onready var hitbox1: CollisionShape2D = $HitboxComponent/CollisionShape2D
@onready var hitbox2: CollisionShape2D	= $HitboxComponent2/CollisionShape2D
signal attacked

@export_group("Attack 1 Variables")
@export var attack_damage: int = 5
@export var attack_duration: float
@export var attack_cooldown: float
@export var attack_position: Vector2

@export_group("Attack 2 Variables")
@export var attack_damage2: int = 5
@export var attack_duration2: float
@export var attack_cooldown2: float
@export var attack_position2: Vector2

var on_cooldown = false
var already_hit = false

func _ready() -> void:
	already_hit = false
	if hitbox1:
		hitbox1.disabled = true
	if hitbox2:
		hitbox2.disabled = true

func attack1(direction: Vector2, current_phase):
	if on_cooldown:
		return
	else:
		self.rotation = direction.angle()
		attacked.emit()
		hitbox1.disabled = false
		on_cooldown = true
		await get_tree().create_timer(attack_duration).timeout
		hitbox1.disabled = true
		already_hit = false
		cooldown.start(attack_cooldown)

func attack2(direction: Vector2, current_phase):
	if on_cooldown:
		return
	else:
		self.rotation = direction.angle()
		attacked.emit()
		hitbox2.disabled = false
		on_cooldown = true
		await get_tree().create_timer(attack_duration2).timeout
		hitbox2.disabled = true
		already_hit = false
		cooldown.start(attack_cooldown2)
		
		
func _on_cooldown_timeout() -> void:
	on_cooldown = false

func _on_hitbox_component_area_entered(area: Area2D) -> void:
	print("hit")
	if area is HitboxComponent and !already_hit:
		print("hitbox")
		already_hit = true
		area.damage(attack_damage)
