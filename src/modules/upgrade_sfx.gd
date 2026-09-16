extends Node

@onready var _error_sfx: AudioStreamPlayer2D = $Error
@onready var _confirmation_sfx: AudioStreamPlayer2D = $Confirmation


func error() -> void:
	_error_sfx.play()

func confirmation() -> void:
	_confirmation_sfx.play()
