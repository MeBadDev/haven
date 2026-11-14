extends StaticBody2D
@export_file_path("*.tscn") var next_scene :String
@onready var anim_player := $AnimationPlayer

var is_activated := false

func _ready() -> void:
	$CanvasLayer/ColorRect.show()
	anim_player.play_backwards("fade")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if is_activated:
		return

	if body is Player:
		is_activated = true
		anim_player.play("fade")
		await anim_player.animation_finished
		get_tree().change_scene_to_file(next_scene)
