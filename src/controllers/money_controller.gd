extends Container

# global money variable to keep track of the player's money
@export var money: int = 0

# money label (TextLabel) to display the current money amount
@onready var TLabel: Label = $Label

func _process(_delta) -> void:
	# update money label text every frame
	TLabel.text = str(money)
