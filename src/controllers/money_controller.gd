extends Container

var money: int = 0

@onready var TLabel: Label = $Label

func _process(_delta) -> void:
	TLabel.text = str(money)
