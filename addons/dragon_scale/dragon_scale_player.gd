@tool
extends AudioStreamPlayer
class_name DragonScalePlayer
## Convenience node to make using [DragonScaleStream] resources easier with helper functions.


## Local intensity for the node.  This value overwrites the stream's intensity value, but not the other way around.
## If you change the intensity value on the stream directly, it will [b]NOT[/b] be updated on the player node.
@export_range(0.0, 1.0, 0.01) var intensity := 0.0 : 
	set(value):
		intensity = value
		set_intensity(value)


# When the node is created, it adds a new DragonScaleStream resource to itself if one doesnt exist.
func _init() -> void:
	if stream == null:
		stream = DragonScaleStream.new()


func _ready() -> void:
	set_intensity(intensity)


# Tween for the intensity value
var _intensity_tween : Tween
## Convenience function for setting the intensity on the stream.  Sets the intensity to the given [param new_intensity] 
## and tweens to that value over a given [param travel_time].  If [param travel_time] is 0, the value is set instantly.
func set_intensity(new_intensity : float, travel_time : float = 0.0) -> void:
	if !stream or stream is not DragonScaleStream:
		return

	if _intensity_tween:
		_intensity_tween.kill()
		_intensity_tween = null
	
	if travel_time <= 0.0:
		stream.intensity = new_intensity
		return
	
	_intensity_tween = get_tree().create_tween()
	_intensity_tween.tween_property(stream, "intensity", new_intensity, travel_time)
