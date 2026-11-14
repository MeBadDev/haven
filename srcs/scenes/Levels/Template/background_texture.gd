@tool
extends TextureRect

const possible_textures :Array[Texture2D] = [
	preload("res://srcs/assets/Backgrounds/Blue.png"),
	preload("res://srcs/assets/Backgrounds/Brown.png"),
	preload("res://srcs/assets/Backgrounds/Gray.png"),
	preload("res://srcs/assets/Backgrounds/Green.png"),
	preload("res://srcs/assets/Backgrounds/Pink.png"),
	preload("res://srcs/assets/Backgrounds/Purple.png"),
	preload("res://srcs/assets/Backgrounds/Yellow.png")
]
func _ready() -> void:
	texture = possible_textures.pick_random()
