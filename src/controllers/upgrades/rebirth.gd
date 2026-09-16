extends Button

const BUTTON_EFFECTS_MODULE = preload("res://src/modules/button_effects.gd")
var _effects = BUTTON_EFFECTS_MODULE.new()

@onready var _currency_container = $"../../CurrencyContainer"
@onready var _sfx = $"../../Sfx"
@onready var _money_per_click = $"../MoneyPerClick"
@onready var _planet_button = $"../../TheButton"

var money_multiplier: float = 1.0

# base cost for rebirth, doubles with each rebirth
@export var cost: int = 1028
@export var rebirth_count: int = 1

func _wipe() -> void:
	_currency_container.money = 0
	_money_per_click.money_per_click = 1
	_money_per_click.cost = 1
	_money_per_click.update_text()

func _ready() -> void:
	pivot_offset_ratio = Vector2(0.5, 0.5)

	pressed.connect(func() -> void:
		if cost <= _currency_container.money and rebirth_count < 9:
			_sfx.confirmation()
			_wipe()
			money_multiplier *= 2
			cost *= 2
			rebirth_count += 1
			_planet_button.icon = load("res://assets/planets/planet%02d.png" % rebirth_count)
		else:
			_sfx.error()
	)
	button_down.connect(_effects.play_pressing_effect.bind(self, Vector2(0.95, 0.95)))
	pressed.connect(_effects.play_pressed_effect.bind(self, Vector2(1.0, 1.0)))
	mouse_exited.connect(_effects.play_released_effect.bind(self, Vector2(1, 1)))
	mouse_entered.connect(_effects.play_hover_effect.bind(self, Vector2(1.05, 1.05)))

func _process(_delta) -> void:
	text = "$" + str(cost) + " Rebirth"
