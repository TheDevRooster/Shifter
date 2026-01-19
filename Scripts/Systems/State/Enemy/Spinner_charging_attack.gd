extends State
class_name SpinnerChargeAttack


@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"

@export var enemy: CharacterBody2D
@export var charge_timer: Timer


func Enter():
	animated_sprite_2d.play('ChargingAttack')
	charge_timer.start()
	enemy.velocity = Vector2(0,0)
	






func _on_timer_timeout() -> void:
	state_changed.emit(self, 'attack')


func Exit():
	charge_timer.stop()
