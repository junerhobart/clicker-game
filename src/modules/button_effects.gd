extends RefCounted

var _tween: Tween

func _create_tween(button: Button, property: String, value: Variant, duration: float, trans = Tween.TRANS_BACK, my_ease = Tween.EASE_OUT) -> void:
	if _tween: _tween.kill()
	_tween = button.create_tween()

	_tween.set_trans(trans)
	_tween.set_ease(my_ease)

	_tween.tween_property(button, property, value, duration)

#TODO: make functions optionally configable 

func play_pressing_effect(button: Button) -> void:

	_create_tween(button, "scale", Vector2(0.9,0.9 ),0.1)

func play_pressed_effect(button: Button) -> void:

	_create_tween(button, "scale", Vector2(1.2,1.2),0.15)

func play_released_effect(button: Button) -> void:

	_create_tween(button, "scale", Vector2(1,1),0.15)

func play_hover_effect(button: Button) -> void:

	_create_tween(button, "scale", Vector2(1.2,1.2),0.15)
