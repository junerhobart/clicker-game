extends Node

@onready var errorsfx: AudioStreamPlayer2D = $Error
@onready var confirmationsfx: AudioStreamPlayer2D = $Confirmation
@onready var clicksfx: AudioStreamPlayer2D = $Click

func error() -> void:
    errorsfx.play()

func confirmation() -> void:
    confirmationsfx.play()

func click() -> void:
    clicksfx.play()