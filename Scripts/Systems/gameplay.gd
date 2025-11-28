extends Node2D

@onready var level_manager: Node = $LevelManager
@onready var player: Player = $Player
@onready var ui = $UI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  	


func _on_player_interacted(target: Variant) -> void:
	#print('The target being sent to the player_interacted target is : ',target)
	target.interaction()
			
			
func console_interacted(screen_id):
	match screen_id:
		"terminal_console":
			if !ui.terminal_console.visible:
				print("making console visible")
				ui.terminal_console.open()
				get_tree().paused = true
				

####  This function Handles Changing Levels and going through Doorways ####


func _on_level_level_change(level_change: PackedScene) -> void:
	var next_level = level_change.instantiate()
	level_manager.get_child(0).queue_free()
	level_manager.add_child(next_level)
	player.position = next_level.spawnpoint


func on_talked_to_scientist(conversation):
	print('conversation starting from gameplay node please')
	ui.start_dialogue(conversation)
	
