extends Node

@onready var _error_sfx: AudioStreamPlayer2D = $Error
@onready var _confirmation_sfx: AudioStreamPlayer2D = $Confirmation
@onready var _click_sfx: AudioStreamPlayer2D = $Click

func error() -> void:
    _error_sfx.play()

func confirmation() -> void:
    _confirmation_sfx.play()

func click() -> void:
    _click_sfx.play()
