extends Node2D

@onready var ui = $UI
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for item in get_tree().get_nodes_in_group("Consoles"):
		item.connect("console_interacted", console_interacted)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_interacted(target: Variant) -> void:
	target.interaction()

func console_interacted(screen_id):
	match screen_id:
		"terminal_console":
			if !ui.terminal_console.visible:
				print("making console visible")
				ui.terminal_console.open()
				get_tree().paused = true
				
