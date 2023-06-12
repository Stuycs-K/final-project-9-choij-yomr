# APCS Final Project
THIS DOCUMENT IS REQUIRED

## Group Info
Name: 4Head Emulators \
Period 9 \
Members: 
- Joshua C.
- Richard Y.


## Overview
We will be re-creating the classic puzzle game Tetris. To accomplish this, we have a
Shape Class and a Board class. In unison, these classes will allow for different pieces to
spawn, rotate, move, fall, and clear lines.

As a MVP (minimum viable product), we have all the Tetris pieces including their rotations. These pieces are able to fall down, get pushed down all the way and be held for future use. Once a line is completed, that line will be
deleted and the player will be awarded points. The player will have the ability to hold pieces as well as see
what the next piece will be.

For our final product, we added various features to make the game more appealing and exciting.
Some of these features include a transparent image of the block at the bottom to indicate to the player
where their piece is going to land, a menu option for players to change various settings, and a different
game mode the player can choose to play. We also added sound for better immersion. 


## Instructions
Tetris!
The objective of Tetris is to complete as many lines as possible by utilizing
various block combinations in order to not run out of space. 

Please look at the diagram below to see what certain keys do!

![alt text](https://github.com/Stuycs-K/final-project-9-choij-yomr/blob/main/instructions.png?raw=true)

Briefly Explaning our Project:

The play button allows the player to start the game.
The setting button allows the player to change various settings including:
- music volume
- sfx volume
- difficulty 
    There are four modes of difficulty: easy, medium, hard, and insane. 
    Easy starts at level 1. Every 20 line clears, you advance a level. 
    Medium starts at level 3. Every 15 line clears, you advance a level. 
    Hard starts at level 3. Every 10 line clears, you advance a level. 
    Insane starts out at the hardest level.
- game mode (corruption)
    The corruption gamemode has corrupted blocks already locked onto the board and you have to 
    clear these corrupted blocks to the bottom to win the game.
The instructions button allows the player to view the controls to the game.
The setups button allows the player to easily get to a scenario to test various functions:
- T-spins
- Wall-kicks
- Line clears
