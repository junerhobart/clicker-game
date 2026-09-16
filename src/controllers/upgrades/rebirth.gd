extends Button

const ButtonEffectsModule = preload("res://src/modules/button_effects.gd")
var effects = ButtonEffectsModule.new()

@onready var CurrencyContainer = $"../../CurrencyContainer"
@onready var sfx = $"../../SFX"
@onready var money_per_click = $"../MoneyPerClick"
@onready var planet_button = $"../../The Button"

var planet_assetsdict = "res://assets/planets/"

var money_multiplier: float = 1.0

# base cost for rebirth, doubles with each rebirth
@export var cost: int = 1028
@export var rebirthCount: int = 1

func wipe() -> void:
	CurrencyContainer.money = 0
	money_per_click.moneyPerClick = 1
	money_per_click.cost = 1
	money_per_click.updateText()

func _ready() -> void:
	pivot_offset_ratio = Vector2(0.5, 0.5)

	pressed.connect(func() -> void:
		if cost <= CurrencyContainer.money and rebirthCount < 9:
			sfx.confirmation()
			wipe()
			money_multiplier *= 2
			cost *= 2
			rebirthCount += 1
			planet_button.icon = load("res://assets/planets/planet%02d.png" % rebirthCount)
		else:
			sfx.error()
	)
	button_down.connect(effects.play_pressing_effect.bind(self))
	pressed.connect(effects.play_pressed_effect.bind(self))
	mouse_exited.connect(effects.play_released_effect.bind(self))
	mouse_entered.connect(effects.play_hover_effect.bind(self))

func _process(_delta) -> void:
	text = "$" + str(cost) + " Rebirth"
