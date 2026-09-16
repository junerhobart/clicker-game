extends RefCounted

var tween: Tween

func createTween(button: Button, property: String, value: Variant, duration: float, trans = Tween.TRANS_BACK, myease = Tween.EASE_OUT) -> void:
	if tween: tween.kill()
	tween = button.create_tween()

	tween.set_trans(trans)
	tween.set_ease(myease)

	tween.tween_property(button, property, value, duration)

#TODO: make functions optionally configable 

func play_pressing_effect(button: Button) -> void:

	createTween(button, "scale", Vector2(0.9,0.9 ),0.1)

func play_pressed_effect(button: Button) -> void:

	createTween(button, "scale", Vector2(1.2,1.2),0.15)

func play_released_effect(button: Button) -> void:

	createTween(button, "scale", Vector2(1,1),0.15)

func play_hover_effect(button: Button) -> void:

	createTween(button, "scale", Vector2(1.2,1.2),0.15)
