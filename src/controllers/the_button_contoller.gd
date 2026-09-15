class_name ButtonController
extends Button

const ButtonEffectsModule = preload("res://src/modules/button_effects.gd")

@onready var money_label = $"../CurrencyContainer"

var effects: ButtonEffectsModule


func _ready() -> void:
	pivot_offset_ratio = Vector2(0.5, 0.5)
	
	effects = ButtonEffects.new()
	button_down.connect(effects.play_pressing_effect.bind(self))
	pressed.connect(effects.play_pressed_effect.bind(self))

	pressed.connect(func() -> void:
		money_label.money += 1
	)

	mouse_exited.connect(effects.play_released_effect.bind(self))
	mouse_entered.connect(effects.play_hover_effect.bind(self))
