extends State
class_name EnemyFollow

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

@export var enemy: CharacterBody2D
@export var move_speed:= 20
@export var attack_range: int


func Enter():
	print(player)
	animated_sprite_2d.play("Chasing")
	
func Physics_Update(_delta: float):
	if !player:
		player = get_tree().get_first_node_in_group("Player")
	var direction = player.global_position - enemy.global_position
	if direction.length() > 0:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
	if direction.length() > 50:
		state_changed.emit(self, "Idle")

func Update(_delta: float):
	if (player.global_position - enemy.global_position).length() < attack_range:
		state_changed.emit(self,"chargingattack")
		print("starting attack")
