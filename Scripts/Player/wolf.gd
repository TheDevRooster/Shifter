extends Phase
class_name WolfPhase


@onready var animated_sprite: AnimatedSprite2D = $VisualBranch/AnimatedSprite2D
@onready var attack1hitbox: Area2D = $Attack1Hitbox
@onready var attack2hitbox: Area2D = %Attack2Hitbox
@onready var attack_cooldown: Timer = $AttackCooldown
@onready var hit_box: HitboxComponent = $HitboxComponent
signal attack_finished

func attack1(direction:Vector2):
	print("attacking")
	attack_cooldown.start()
	attack1hitbox.get_child(0).disabled = false
	await attack_finished
	attack1hitbox.get_child(0).disabled = true
	await attack_cooldown.timeout
	attack_finished.emit()
	
	
func attack2(direction:Vector2):
	print("attacking2")
	attack_cooldown.start()
	#attack1hitbox.get_child(0).disabled = false
	await attack_cooldown.timeout
	#attack1hitbox.get_child(0).disabled = true
	attack_finished.emit()
	
