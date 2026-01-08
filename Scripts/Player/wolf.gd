extends Phase
class_name WolfPhase


@onready var attack1hitbox: Area2D = $Attack1Hitbox



func attack1(direction:Vector2, current_phase):
	print("wolf form attacking")
	print(attack1hitbox.get_overlapping_areas())
