class_name LineTrack
extends Line2D

const MAX_POINTS: int = 50
@export var gap: float = 64
var moveDistance: float = 0

func _ready() -> void:
	set_as_top_level(true)
	texture_repeat = TEXTURE_REPEAT_ENABLED

func moved(distance: float) -> void:
	moveDistance  += distance
	if moveDistance > gap:
		moveDistance -= gap
		prints("Placing", points.size())
		add_point(get_parent().global_position)
		if points.size() > MAX_POINTS:
			remove_point(0)
