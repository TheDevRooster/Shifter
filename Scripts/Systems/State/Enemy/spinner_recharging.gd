extends State


@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var recharge_timer: Timer

func Enter():
	animated_sprite_2d.play("Recharging")
	recharge_timer.start()
	
	

func Exit():
	recharge_timer.stop()
	


func _on_recharge_timer_timeout() -> void:
	state_changed.emit(self, 'idle')
