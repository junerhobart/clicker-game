extends RefCounted

var _tween: Tween

func create_tween(button: Button, property: String, value: Variant, duration: float, trans = Tween.TRANS_BACK, my_ease = Tween.EASE_OUT) -> void:
	if _tween: _tween.kill()
	_tween = button.create_tween()

	_tween.set_trans(trans)
	_tween.set_ease(my_ease)

	_tween.tween_property(button, property, value, duration)

func play_pressing_effect(button: Button, scale: Vector2, time: float = 0.1) -> void:
	create_tween(button, "scale", scale, time)

func play_pressed_effect(button: Button, scale: Vector2, time: float = 0.15) -> void:
	create_tween(button, "scale", scale, time)

func play_released_effect(button: Button, scale: Vector2, time: float = 0.15) -> void:
	create_tween(button, "scale", scale, time)

func play_hover_effect(button: Button, scale: Vector2, time: float = 0.15) -> void:
	create_tween(button, "scale", scale, time)
