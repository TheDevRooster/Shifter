extends State
class_name EnemyIdle


@export var enemy: CharacterBody2D
@export var move_speed:= 10.0  
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

var move_direction: Vector2
var wander_time: float


func randomize_wander():
	move_direction = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,3)

func Enter():
	print(player)
	animated_sprite_2d.play("Idle")
	randomize_wander()
	player = get_tree().get_first_node_in_group("Player")

func Update(delta: float):
	#print("Idle Running")
	if wander_time > 0:
		wander_time -= delta
	
	else:
		randomize_wander()
	var direction = player.global_position - enemy.global_position
	
	if direction.length() < 50:
		state_changed.emit(self, "following")

func Physics_Update(_delta: float):
	if !player:
		player = get_tree().get_first_node_in_group("Player")
	if enemy:
		enemy.velocity = move_direction * move_speed
		
