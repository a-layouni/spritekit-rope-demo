# SpriteKitRopeDemo
This is a configurable rope demo using SpriteKit joints inspired by https://github.com/mraty/spritekit-ropes/tree/master/Ropes

This version includes a workaround for the elastic effect bug when the number of rope rings/joints increases. Just call [rope adjustRingPositions] from within didSimulatePhysics delegate and the elastic effect should go away.

Move the branch around to observe the physics of the attached rope.

Tested with iPad 2 simulator.
