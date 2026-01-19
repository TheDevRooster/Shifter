extends Area2D
class_name EnemyAttackBox

@onready var hitbox_component: HitboxComponent = $"../HitboxComponent"

var already_hit = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func _on_area_entered(area: Area2D) -> void:
	#print("hit")
	#print(already_hit)
		
	if area is HitboxComponent:
		var player = area.get_parent()
		player.on_hit.emit()
		var opposite_direction = (player.global_position - get_parent().global_position).normalized()
		area.damage(get_parent().attack_damage)
		player.velocity = opposite_direction * get_parent().knockback
		
	
