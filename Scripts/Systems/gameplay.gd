extends Node2D

@onready var level_manager: Node = $LevelManager
@onready var player: Player = $Player
@onready var ui = $UI


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect_consoles() 	


func _on_player_interacted(target: Variant) -> void:
	target.interaction()

func console_interacted(screen_id):
	match screen_id:
		"terminal_console":
			if !ui.terminal_console.visible:
				print("making console visible")
				ui.terminal_console.open()
				get_tree().paused = true
				
func connect_consoles():
	for item in get_tree().get_nodes_in_group("Consoles"):
		item.connect("console_interacted", console_interacted)
	
####  This function Handles Changing Levels and going through Doorways ####


func _on_level_level_change(level_change: PackedScene) -> void:
	var next_level = level_change.instantiate()
	level_manager.get_child(0).queue_free()
	level_manager.add_child(next_level)
	player.position = next_level.spawnpoint
	
	
func start_dialogue(text):
	print(text)

func on_talked_to_scientist(conversation):
	start_dialogue(conversation)
