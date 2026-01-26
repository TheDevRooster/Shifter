- [ ] Tranformation between Phases
	- [x] Changing Every Node needed. Using Phases as a robust Resource Node
	- [x] Particle Effect of smoke between transformations 
- [ ] [[Phases]]
- [ ] [[Wolf Form]]
- [ ] [[Bear Form]]
- [ ] [[Rooster Form]]
- [ ] [[Rat Form]]
- [ ] Animations
	- [x] Set animation to pull from player current phase
	- [ ] Set attacks to play from animation phase
- [ ] State Machine
- [ ] Set up Signal API 
	- [ ] Access When Player is hit
	- [ ] Access CurrentPhase
	- [ ] Access Attack


### Currently Working on

Set animation to pull from player current phase
 1. ~~Set Dict to all possible animation names for each node
	 1. Running
	 2. Idle
	 3. Moving U, D, L, R
	 4. Attack 1
	 5. Attack 2
	 6. Dying
2. ~~Set Up Player Node to pull from Phase
3. ~~Setting a check so player cant attack during an attack!
4. ~~AnimatedNode2D.SpriteFrames Seems to be a solid method to just switch between phases
	1. ~~Instead of moving the whole node just move the saved sprite frames to the current player!
	2. ~~Get sprite data from Phase
	3. ~~Sprites too small when Transformed in. Need to figure out how to also import size or resize images
5. Implement animation system
	1. ~~Need to set direction of Movement
	2. ~~Need to set start frame to be the same as the previous animation.
	3. Figure out Attack Animation....
		1. Watch a video because O my...
	4. Attack Not showing. Issue with timing on how it everything moves. AnimationPlayer May help
		1. Example attack
			1. Attack clicked -> set can attack to false -> animation starts -> hitbox Active -> Hitbox follows animation -> animation finishes -> hitbox deactivates -> cooldown starts -> Cooldown Finishes -> can_attack now equals true


# Today's Objective is ATTACKS WORKING 1/25
- Make it so the nodes themselves have an animation player visual
