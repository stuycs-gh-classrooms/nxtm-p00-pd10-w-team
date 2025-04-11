[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/gbHItYk9)
## Project 00
### NeXTCS
### Period: 10
## Name0: EDGAR GANAHL
## Name1: Makary Ruan
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: MAGNETIC FORCE

### Forumla
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)


F = (kq1q2)/r^2
k = Coulomb constant
q = charge
r = distance

### Custom Force
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
  - It uses attraction for the magnetic field and moving for the velocity.

- Does this force require any new constants, if so what are they and what values will you try initially?
  - Yes it requires a coulomb constant, distance between the two orbs, and charge constant. 

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - Magnitude of charge will need to be added. This is for the magnetism. It is a float.

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - It interacts with other orbs as the magnetism is between one object and another based on the charge of the orbs interacting. 

https://github.com/stuycs-gh-classrooms/nxtm-p00-pd09-chayhana
https://github.com/stuycs-gh-classrooms/nxtm-p00-pd09-duuuuh4444
https://github.com/stuycs-gh-classrooms/nxtm-p00-pd09-ggs
https://github.com/stuycs-gh-classrooms/nxtm-p00-pd09-thieves-ln
https://github.com/stuycs-gh-classrooms/nxtm-p00-pd09-oranges
https://github.com/stuycs-gh-classrooms/nxtm-p00-pd09-kingdaddylebron
https://github.com/stuycs-gh-classrooms/nxtm-p00-pd09-e-m

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - I don't think so.

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.
Utilize the gravity equation and implement it into the Orb or OrbNode. 
--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

The spring simulation will depend on the length of the spring between the orb and orbnodes. This will affect the elongation or compression of the spring. If the spring is comrpessed or elongated, it will have a force bring it apart or together respectively.

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

The drag simulation will have different sections which will affect the strength of the force on the orbs depending on which section it is in. 

--- 

### Simulation 4: Custom force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

Our custom force has orbs displayed with negative or positive on it to demonstrate the charge. It will be setup with a random amount of orbs with different charges to demonstrate the force. It should repel if the charges are the same. If there is a different charge, it should have an attraction towards each other based on distance and other factors.

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

Demonstrates all the simulations together Combination of all the simulations into one.

