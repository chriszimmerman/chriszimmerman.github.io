---
layout: post
---

#Game Programming in C# With XNA

Every year for the past few years I've been going to PAX East in Boston. Every time, I get inspired to make video games but never actually act on that inspiration. I don't know if it's due to A) a lack of original ideas, B) poor artistic skill, C) laziness, or D) all of the above.

Shortly after my trip to PAX East in March of this year, I started a Coursera class about game programming in C#. In this class, I learned about writing C# games using the XNA Framework. The class was aimed at people who have never done programming before, but that was fine. Because I already knew the language features of C# taught in the class, I was able to focus on the XNA objects and APIs, as well as game-programming-specific concepts, such as collision detection, and calculating sprite velocities. A few of the games I created were a simple blackjack game and a game where you are a hamburger that shoots french fries at teddy bears while they bounce around and shoot projectiles at you.

I would like to share what I learned in the course from the XNA and game development perspective. 

##The Game Loop

One of the most fundamental concepts in game programming is the game loop. The game loop constantly runs, checking for user input and updating the environment. For example, the game loop may have code to draw a bullet sprite from a spaceship when the left mouse button is pressed. There may be code to check for when a bullet sprite comes into contact with an alien sprite and play an explosion animation when that occurs. The game loop repeats indefinitely until the game is terminated.

The following code sample is from a simplified blackjack game I wrote for an assignment:

	protected override void Update(GameTime gameTime)
	{
		MouseState mouseState = Mouse.GetState();
		foreach(var menuButton in menuButtons){
			if(currentState == GameState.WaitingForPlayer || currentState == GameState.DisplayingHandResults){
				menuButton.Update(mouseState);
			}
		}

		switch(currentState){
			case GameState.PlayerHitting:
				PlayerHit();
				break;
			case GameState.WaitingForDealer:
				DealerTurn();
				break;
			case GameState.DealerHitting:
				DealerHit();
				break;
			case GameState.CheckingHandOver:
				CheckHandOver();
				break;
			case GameState.DisplayingHandResults:
				break;
			case GameState.Exiting:
				Exit();
				break;
			default:
				break;
		}

		base.Update(gameTime);
	}

Every time this method executes (which is happening very often), it's getting information about the mouse which is stored in mouseState. This includes the X and Y position of the cursor, which button(s) are pressed, etc. The blackjack game was designed around a DFA, the states of which are determined by each of the GameState enum values. If the game is in either of the two states where player input is awaited (GameState.WaitingForPlayer and GameState.DisplayingHandResults), it's going to call the Update method on each menu button within the game, which will check if any of the buttons (such as the Hit, Stand, or Quit buttons) have been clicked. If the game is not in any of those states, it's going to go through the switch statement and execute the appropriate code which represents the DFA transition. 

##Sprites

In 2D game programming, all objects in the world are displayed as sprites. Player characters, enemies the player fights, items the player gets, and other objects and entities in the world are displayed as sprites. Sprites are rectangles of varying sizes that have images placed on them.

place sprite example here

##Collision Detection

In order for games to be interesting, things need to happen when sprites interact with each other. Collision detection is a term used to describe when the game checks for when sprites intersect each other and what to do when that happens. In Super Mario Bros. if Mario walks into a goomba, he shrinks if he's big or he dies if he's small. However, if he jumps on the goomba, he'll bounce back up and get points.

##Some commonly used XNA objects

Mouse, MouseState, Texture2D, Rectangle, velocity2

##The Game Class

One thing I dislike about game programming is that it seems difficult to do great OO programming. In the games I've done, I work out of a giant Game class. I have other classes for objects in my games, but it seems like a lot of stuff exists in my Game class. Game has its fingers in a lot of pies with having Initialize(), LoadContent(), UnloadContent(), Update(), and Draw() methods. I feel like it has too much responsibility.
