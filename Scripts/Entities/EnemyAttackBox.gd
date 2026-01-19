extends Area2D
class_name EnemyAttackBox

@onready var hitbox_component: HitboxComponent = $"../HitboxComponent"

var already_hit = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_area_entered(area: Area2D) -> void:
	print("hit")
	print(already_hit)
		
	if area is HitboxComponent:
		if already_hit:
			already_hit = false
			return
		var player = area.get_parent()
		already_hit = true
		player.invincibilty_frames(.8)
		var opposite_direction = (player.global_position - get_parent().global_position).normalized()
		print("hitbox was component")
		area.damage(get_parent().attack_damage)
		print(area.get_parent().velocity)
		area.get_parent().velocity = opposite_direction * get_parent().knockback
		already_hit = false
		
