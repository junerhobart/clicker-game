extends Button

@onready var money = $"../CurrencyContainer"
var money_per_click: int = 1

var cost: int = 1

func updateCost() -> void:
	cost = int(pow(money_per_click, 2) + cost)

func updateText() -> void:
	text = "$" + str(cost) + " | +1 Per Click" + " (" + str(money_per_click) + ")" 

func _ready() -> void:
	updateText()
	pivot_offset_ratio = Vector2(0.5, 0.5)

	pressed.connect(func() -> void:
		if money.money >= cost:
			money.money -= cost
			money_per_click += 1
			updateCost()

			updateText()
	)
