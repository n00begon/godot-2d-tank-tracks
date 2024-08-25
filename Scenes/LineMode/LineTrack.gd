class_name LineTrack
extends Line2D

const MAX_POINTS: int = 50
@export var gap: float = 64
var moveDistance: float = 0
var parent: Node2D

func _ready() -> void:
	set_as_top_level(true)
	texture_repeat = TEXTURE_REPEAT_ENABLED
	parent = get_parent() as Node2D

func moved(distance: float) -> void:
	moveDistance  += distance
	if moveDistance > gap:
		moveDistance -= gap
		add_point(parent.global_position)
		if points.size() > MAX_POINTS:
			remove_point(0)
