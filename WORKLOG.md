# Dev Log

### Features 

Wall Kicks, T-Spins, Board Creation, Music/SFX, Difficulty Scaling, All menu buttons/sliders, line clears, block placement, 
holding a piece, showing the next piece, all different types of pieces in Tetris, free fall, hard drops, collosion with other
blocks, end screen (game over), win screen (for our corruption gamemode), ghost piece (being able to see where your block will
be placed), line cleared counter, and all our setups for the game.

### Broken Features/Bugs

We wouldn't say it's BROKEN, but when you try to slide the volume/sfx sliders all the way to the left, 
you can get it to hit zero (albeit sometimes difficult). However, when it does hit zero, sometimes
a little bit of blue might still show (like a line of blue), which we couldn't fix in time for the 
final version of the game. It did NOT interfere with actual volume adjusting, which was fine. 

### Content Resources

For music, we had to clip sound of the sounds from a YouTube video to get a specific desired
sound (because there was a collection of them), so we used DaVinci Resolve Studio to achieve that.
For any game creation ideas, we usually looked up Tetris online and found pretty good examples
to follow. In order to create the Tetris logo and instructions page, we used Canva. Wikipedia was 
also really helpful in determining block rotations and T-spins. 

# Work Log

## Richard Yom

### 5/22

worked on creating files in git, learning how to correctly merge, and my branch
creating classes + a little bit of README.md

### 5/23

worked on creating functions, variables, functions, and comments for said functions and variables for clarity
in myPiece.pde

### 5/24

still working on the skeleton + actually
working on making those functions work and developing our worklog + readme

### 5/25

finished README.md for the most part (adding the instructions image + fixing line breaks)

### 5/26

started working on the menu for TETRIS

### 5/27

worked on creating the title font and text design for tetris menu

### 5/28

getting the dimensions for the menu right by testing various rectangles and
figuring out where I want all the buttons to be positioned

### 5/29

tetris image created to be implemented into the processing menu
figured out positions for rectangles and made it more appealing
by using rounded edges

### 5/30

added image to menu, colored buttons
figuring out how to make clickable buttons

### 5/31

font size change for menu, changing text size font
resizing images

### 6/1

finished menu for the most part, implementing a return button
adding instructions page for menu
clickable buttons
added death screen + resized aspect ratio for instructions page
bug fixes

### 6/12

completed settings portion of the menu, which included implementing a 
sound bar, music bar, difficulty, and game mode. I also implemented the 
sound for the game, which included the music and sfx (block place and line clear)
win screen for corruption mode
fixed a lot of bugs

## Joshua Choi

### 5/22

created team, learning how to branch correctly, created my branch

created classes + file names

### 5/23

worked on creating functions, variables, functions, and comments for said functions and variables for clarity
in Board.pde

### 5/24
still working on the skeleton for all classes + actually
working on making those functions work  

### 5/25

did more methods for myPiece.pde and board.pde

### 5/26

worked on more methods for myPiece.pde

### 5/27

functionality with slow fall and fallDown fast
2x2 square piece working w/ clear function

### 5/28

worked on fixing some bugs and worked on more methods

### 5/29

worked on getting the line piece implemented and figuring out delays between block spawning and being able
to move the block

### 5/30

continued working on myPiece and Board, adding a deathzone for blocks
block delay adjusted

### 5/31

continued worked on getting each tetris block implemented w/ proper rotations
fixed bugs with fall down function

### 6/1

finished implementing functions to be ready for mvp
added functionality to play button
added wallkicks for rotations at the edge of the board
added the setups
bug fixes

### 6/3

ghost piece added
timers on rotating/moving pieces when they are on the ground fixed to be consistent
timers for hard fall and normal fall also made consistent

### 6/12

implemented difficulty scaling, fixed a lot of bugs, implemented corruption game mode 
helped implement sfx for sound
