extends Node2D
class_name EnemySpawner


var spawn_timer: Timer
@export var enemy: PackedScene	
@export var enemy_amount: int = 0
@export var enemy_manager: Node
func _ready() -> void:
	spawn_timer = get_child(0)
	spawn_timer.start()


func _on_spawn_timer_timeout() -> void:
	print("enemies remaining: ", enemy_amount)
	if enemy_amount == 0:
		queue_free()
		
	var new_enemy = enemy.instantiate()
	new_enemy.global_position = self.global_position
	enemy_manager.add_child(new_enemy)
	enemy_amount -= 1
		
 
