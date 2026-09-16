extends Container

# global money variable to keep track of the player's money
@export var money: int = 0

# money label (TextLabel) to display the current money amount
@onready var _money_label: Label = $Label

func _process(_delta) -> void:
	# update money label text every frame
	_money_label.text = str(money)
