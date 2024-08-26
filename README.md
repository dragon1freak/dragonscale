# DragonScale - An audio intensity addon



Easily control the intensity of your layered audio tracks with a new `DragonScaleStream` resource and convenience nodes for the three different `AudioStreamPlayer` nodes!  Heavily inspired by the [Ovani](https://ovanisound.com/) Godot music plugin.
<details>
<summary>Preview Video</summary>
  
https://github.com/user-attachments/assets/93dec048-7f1b-40c1-93fe-516c1b758781
</details>

### Installation
Just drop the `addons` folder into your project if you dont have one already, or add the `dragon_scale` folder into your existing `addons` folder.  You may need to reload your project but the new resource and nodes should be available!

### DragonScaleStream
An extension of the `AudioStreamSynchronized` resource, add at least one audio track and this new resource uses an intensity value to control the volume of the different tracks!  Works with any number of tracks, but the default is three.

### DragonScalePlayer
An extension of the `AudioStreamPlayer`, this node functions identically to the inherited class except for the new local intensity value and helper functions.  There are also `DragonScalePlayer2D` and `DragonScalePlayer3D` nodes that function the same way.
- `set_intensity(new_intensity, travel_time = 0.0)`: Set the intensity to the new value tweened to the given travel time.  If the travel time is 0, the intensity is set instantly.

### Roadmap(?)
- Add icons for the nodes etc
- Add function to jump to a specific intensity breakpoint by index
- Add DragonScaleInteractiveStream resource to easily set the intensity on active interactive tracks


