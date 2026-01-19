extends State

@onready var dash_timer = $DashTimer

@export var dash_speed: int
@export var enemy: CharacterBody2D
var player_location


func Enter():
	dash_timer.start()
	var player_direction = player.global_position - enemy.global_position
	enemy.velocity = player_direction.normalized() * dash_speed
	
	
func Physics_Update(_delta: float):
	enemy.move_and_slide()
	


func _on_dash_timer_timeout() -> void:
	enemy.velocity = Vector2()
	state_changed.emit(self, 'recharging')
	
func Exit():
	dash_timer.stop()
