extends interact_zone

signal console_interacted(screen_id)

var console_menu_scene = load("res://Scenes/Screens/terminal_console.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.


func interaction() -> void:
    console_interacted.emit("terminal_console")
	
