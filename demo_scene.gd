extends Node2D


@onready var current_intensity: Label = %CurrentIntensity
@onready var direct_slider: HSlider = %DirectLabel/DirectSlider

@onready var dragon_scale_player: DragonScalePlayer = $DragonScalePlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	direct_slider.value_changed.connect(_on_direct_value_changed)


func _process(_delta: float) -> void:
	current_intensity.text = "Current Intensity: " + str(dragon_scale_player.stream.intensity)


func _on_direct_value_changed(new_value) -> void:
	dragon_scale_player.set_intensity(new_value)
