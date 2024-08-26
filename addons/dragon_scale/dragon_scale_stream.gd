@tool
class_name DragonScaleStream
extends AudioStreamSynchronized
## Extension of the [AudioStreamSynchronized] that allows controlling 
## the overal intensity of the layered tracks through a simple linear value


## The default number of tracks for the stream resource on initialization
const BASE_INTERACTIVE_TRACKS := 3

## The intensity of the music on a linear scale.  An intensity of 0 means the first track (index [code]0[/code]) is
## most intense and an intensity of 1 means the last track (index [code]stream_count - 1[/code]).  If there is
## only one track, the intensity will act as a linear volume value for that one track.
@export_range(0.0, 1.0, 0.01) var intensity := 0.0 : 
	set(value):
		intensity = value
		_set_intensity(value)

# The number of transition segments between tracks.  For example, if you have three tracks, there are two transition segments, 
# 0.0 <-> 0.5 and 0.5 <-> 1.0.  This is simply the number of streams minus one.
var _segment_count : int :
	get:
		return self.stream_count - 1 if self.stream_count else 0


# When the resource is initialized, three empty streams are created.  This is just the default, any number of streams works.
func _init() -> void:
	if self.stream_count <= 0:
		self.stream_count = BASE_INTERACTIVE_TRACKS


func _ready() -> void:
	_set_intensity(intensity)


# Calculates the intensity for a given index.  If there is only one stream, the intensity value is used instead.
func _calc_intensity(index) -> float:
	if _segment_count <= 0:
		return intensity
	
	var calc_value = ((1.0 / float(_segment_count)) - abs(intensity - float(index) / float(_segment_count))) * float(_segment_count)

	return min(1, max(0, calc_value))


# Sets the intensity of all streams based on their calculated intensity at the related index.
func _set_intensity(value) -> void:
	if stream_count <= 0:
		return
	
	for index in range(self.stream_count):
		self.set_sync_stream_volume(index, linear_to_db(_calc_intensity(index)))
