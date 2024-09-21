class_name SpriteTrack
extends Sprite2D

var startAlpha: float = 1
var fadeSpeed: float = startAlpha/20

func _ready() -> void:
	visible = false

func place(placement: Transform2D) -> void:
	global_transform = placement
	z_index = 0
	visible = true
	modulate.a = startAlpha

func _process(delta: float) -> void:
	if visible:
		fade(delta)

func fade(delta: float) -> void:
	modulate.a -= fadeSpeed * delta
	if modulate.a <= 0:
		visible = false
