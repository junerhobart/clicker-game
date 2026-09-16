extends Button

const ButtonEffectsModule = preload("uid://c28lvt14ng4jj")
var effects = ButtonEffectsModule.new()
@onready var sfx = $"../../SFX"
@onready var CurrencyContainer = $"../../CurrencyContainer"

@export var moneyPerClick: int = 1

@export var cost: int = 1

var money: int:
	get: return CurrencyContainer.money 
	set(value): CurrencyContainer.money = value

func updateCost() -> void:
	cost = int(pow(moneyPerClick, 2) + cost)

func updateText() -> void:
	text = "$" + str(cost) + " | +$1 Per Click" + " (" + str(moneyPerClick) + ")" 
	
func _ready() -> void:
	pivot_offset_ratio = Vector2(0.5, 0.5)
	
	# button effects:
	mouse_exited.connect(effects.play_released_effect.bind(self))
	mouse_entered.connect(effects.play_hover_effect.bind(self))
	button_down.connect(effects.play_pressing_effect.bind(self))
	pressed.connect(effects.play_pressed_effect.bind(self))

	updateText()

	# if pressed then:
	pressed.connect(func() -> void:
		if money >= cost:
			money -= cost
			moneyPerClick += 1

			updateCost()
			updateText()

			sfx.confirmation()
		else:
			sfx.error()
	)
