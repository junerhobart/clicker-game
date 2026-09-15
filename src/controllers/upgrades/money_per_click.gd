extends Button

const ButtonEffectsModule = preload("res://src/modules/button_effects.gd")
var effects = ButtonEffectsModule.new()
@onready var sfx = $"../../SFX"
@onready var money = $"../../CurrencyContainer"

var money_per_click: int = 1

var cost: int = 1

func updateCost() -> void:
	cost = int(pow(money_per_click, 2) + cost)

func updateText() -> void:
	text = "$" + str(cost) + " | +1 Per Click" + " (" + str(money_per_click) + ")" 

func _ready() -> void:

	mouse_exited.connect(effects.play_released_effect.bind(self))
	mouse_entered.connect(effects.play_hover_effect.bind(self))
	button_down.connect(effects.play_pressing_effect.bind(self))
	pressed.connect(effects.play_pressed_effect.bind(self))

	updateText()
	pivot_offset_ratio = Vector2(0.5, 0.5)

	pressed.connect(func() -> void:
		if money.money >= cost:
			money.money -= cost
			money_per_click += 1
			updateCost()
			sfx.confirmation()
			updateText()
		else:
			sfx.error()
	)
