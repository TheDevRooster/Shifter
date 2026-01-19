extends Phase
class_name WolfPhase



@onready var attack1hitbox: Area2D = $Attack1Hitbox
@onready var attack_cooldown: Timer = $AttackCooldown

signal attack_finished

func attack1(direction:Vector2):
	print("attacking")
	attack_cooldown.start()
	#attack1hitbox.get_child(0).disabled = false
	await attack_cooldown.timeout
	print("Cooldown over")
	#attack1hitbox.get_child(0).disabled = true
	attack_finished.emit()
	print("Signal Emmittied")
	
	
func attack2(direction:Vector2):
	print("attacking2")
	#attack1hitbox.get_child(0).disabled = false
	#await get_tree().create_timer(attack_duration).timeout
	#attack1hitbox.get_child(0).disabled = true
	
	
