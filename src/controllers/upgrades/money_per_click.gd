extends Button

const BUTTON_EFFECTS_MODULE = preload("uid://c28lvt14ng4jj")
var _effects = BUTTON_EFFECTS_MODULE.new()
@onready var _sfx = $"../../Sfx"
@onready var _currency_container = $"../../CurrencyContainer"

@export var money_per_click: int = 1

@export var cost: int = 1

var _money: int:
	get: return _currency_container.money
	set(value): _currency_container.money = value

func _update_cost() -> void:
	cost = int(pow(money_per_click, 2) + cost)

func update_text() -> void:
	text = "$" + str(cost) + " | +$1 Per Click" + " (" + str(money_per_click) + ")"

func _ready() -> void:
	pivot_offset_ratio = Vector2(0.5, 0.5)

	# button effects:
	button_down.connect(_effects.play_pressing_effect.bind(self, Vector2(0.95, 0.95)))
	pressed.connect(_effects.play_pressed_effect.bind(self, Vector2(1.0, 1.0)))
	mouse_exited.connect(_effects.play_released_effect.bind(self, Vector2(1, 1)))
	mouse_entered.connect(_effects.play_hover_effect.bind(self, Vector2(1.05, 1.05)))

	update_text()

	# if pressed then:
	pressed.connect(func() -> void:
		if _money >= cost:
			_money -= cost
			money_per_click += 1

			_update_cost()
			update_text()

			_sfx.confirmation()
		else:
			_sfx.error()
	)
