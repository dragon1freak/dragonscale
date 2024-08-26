extends Button


@export var target_intensity := 0.0
@export var time := 1


@onready var dragon_scale_player: DragonScalePlayer = %DragonScalePlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(_on_press)


func _on_press():
	dragon_scale_player.set_intensity(target_intensity, time)
