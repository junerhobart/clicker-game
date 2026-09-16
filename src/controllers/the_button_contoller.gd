extends Button

const ButtonEffectsModule = preload("res://src/modules/button_effects.gd")

@onready var money_label = $"../CurrencyContainer"
@onready var click_upgrade = $"../UpgradeButtons/MoneyPerClick"
@onready var clicksfx: AudioStreamPlayer2D = $"../SFX/Click"
@onready var rebirth = $"../UpgradeButtons/Rebirth"

var effects: ButtonEffectsModule

func _input(event: InputEvent) -> void:
	if not event.is_action("press_the_button"):
		return

	get_viewport().set_input_as_handled()

	if event.is_action_pressed("press_the_button"):
		pressed.emit()
		clicksfx.play()
	elif event.is_action_released("press_the_button"):
		effects.play_released_effect(self)

func _ready() -> void:
	pivot_offset_ratio = Vector2(0.5, 0.5)

	effects = ButtonEffectsModule.new()

	button_down.connect(effects.play_pressing_effect.bind(self))
	pressed.connect(effects.play_pressed_effect.bind(self))
	button_down.connect(clicksfx.play)
	pressed.connect(func() -> void:
		money_label.money += int(click_upgrade.moneyPerClick * rebirth.money_multiplier)
	)

	mouse_exited.connect(effects.play_released_effect.bind(self))
	mouse_entered.connect(effects.play_hover_effect.bind(self))
