# godot-2d-tank-tracks

Examples of drawing tank track marks in godot. Each type of implementation is self contained so you can easily experiment with them. 

![image](https://github.com/user-attachments/assets/eac460b8-cb1b-493f-abc6-085c4d25b3f3)

## Sprite Mode
Uses an array of sprites which have thier own code to fade out
+  Easy to implement and modify
+ Handles variable speed
-  Needs special clean up as they are parented to the ground
-  Most CPU

## Line Mode
Uses a textured Line2D to display the tracks
+ Easiest implementation
+ Least CPU Usage
+ Handles variable speed
- Artifacts on corners
- Texture jumps when the line is at maximum length

## CPU Particles
Normal particle emition, stops emitting when the tank is stopped
+ Easy to implement
+ Low CPU Usage
- Different behaviour at different speeds
- Can create gaps

## GPU Particles
Uses 'Emit' based on distance. Uses an array of GPU Particles
+ Low CPU Usage
+ Handles variable speed
- Fragile - modifying the particle flags can break it
- Hard to modify
