extends State

var player
@export var knockback_timer: Timer


func Enter():
	knockback_timer.start()
	player.player_hitbox.monitoring = false
	
	await knockback_timer.timeout
	state_changed.emit(self, "idle")


func Physics_Update(_delta: float):
	player.move_and_slide()
	
	
func Exit():
	player.just_hit = false
	
