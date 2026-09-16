class_name ButtonController
extends Button

const BUTTON_EFFECTS_MODULE = preload("res://src/modules/button_effects.gd")

@onready var _money_label = $"../CurrencyContainer"
@onready var _click_upgrade = $"../UpgradeButtons/MoneyPerClick"
@onready var _click_sfx: AudioStreamPlayer2D = $"../Sfx/Click"
@onready var _rebirth = $"../UpgradeButtons/Rebirth"

var _effects: BUTTON_EFFECTS_MODULE

func _input(event: InputEvent) -> void:
	
	if not event.is_action("press_the_button"):
		return

	get_viewport().set_input_as_handled()

	if event.is_action_pressed("press_the_button"):
		pressed.emit()
		_click_sfx.play()
	elif event.is_action_released("press_the_button"):
		_effects.play_released_effect(self)

func _ready() -> void:
	pivot_offset_ratio = Vector2(0.5, 0.5)
	
	_effects = BUTTON_EFFECTS_MODULE.new()

	button_down.connect(_effects.play_pressing_effect.bind(self))
	pressed.connect(_effects.play_pressed_effect.bind(self))
	button_down.connect(_click_sfx.play)
	pressed.connect(func() -> void:
		_money_label.money += int(_click_upgrade.money_per_click * _rebirth.money_multiplier)
	)

	mouse_exited.connect(_effects.play_released_effect.bind(self))
	mouse_entered.connect(_effects.play_hover_effect.bind(self))
