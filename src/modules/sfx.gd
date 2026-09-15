extends Node

@onready var errorsfx: AudioStreamPlayer2D = $Error
@onready var confirmationsfx: AudioStreamPlayer2D = $Confirmation


func error() -> void:
    errorsfx.play()

func confirmation() -> void:
    confirmationsfx.play()