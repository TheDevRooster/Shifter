extends State

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var enemy: CharacterBody2D



func Enter():
	enemy.velocity = Vector2()
	animated_sprite_2d.play("Death")
	await animated_sprite_2d.animation_finished
	enemy.queue_free()
	
