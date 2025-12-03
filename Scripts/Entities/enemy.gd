extends CharacterBody2D




func on_died():
	print("died")
	queue_free()

func on_healed():
	print("healed")
