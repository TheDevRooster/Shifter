extends Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Timer ready function RAN")


func _process(delta: float) -> void:
	print("active")
