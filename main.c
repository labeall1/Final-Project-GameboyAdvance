/*****************************************
Game/Gameplay: 
I created an infinite runner
game, where Spongebob is the main character
and he is trying to catch as many pink jellyfish
as he can before his health runs out. The game
mechanics are similar to Flappy Bird in regards
to how I use gravity and jellyfish coming 
towards Spongebob. However, he uses his jellyfish
net to catch the pink jellyfish while he is
running. He loses his health by running into
"bad" (green and blue) jellyfish.

Bugs: None that I know of

Extra Credit:
Alpha Blending - I used alpha blending
for the green jellyfish to make it more
difficult for the player to avoid. 

The alpha blending register is located under
the goToGame() method. The code for the actual
blending part is at the beginning of update().
I also put the ATTR0_BLEND attribut for the
green jellyfish.
******************************************/

#include "myLib.h"
#include <stdio.h>
#include <stdlib.h>
#include "splash.h"
#include "game.h"
#include "instructions.h"
#include "lose.h"
#include "pause.h"
#include "hooks.h"
#include "sea.h"
#include "update.h"
#include "drawing.h"
#include "sprites.h" 
#include "instructions2.h"
#include "instructions3.h"
#include "backgroundSong.h" 
#include "laugh.h"


volatile unsigned int buttons, oldButtons;

OBJ_ATTR shadowOAM[128];

//Sprites
SPRITE spongebob;
SPRITE heart;
SPRITE plusFive;

OBSTACLE obstacles[MAXOBSTACLES];
OBSTACLE jellyfish[MAXOBSTACLES];
OBSTACLE obstacles2[MAXOBSTACLES];

SOUND soundA;
SOUND soundB;

int vOff;
int hOff;

int avoidedObstacles;

int timer;
int pinkObstacleTime;
int blueObstacleTime;
int greenObstacleTime;
int tempTimer;
int loseTimer;

int caughtFish;
int health;
int cheat;
int addFive;
int stop;


//Alpha Blending Stuff
int type;
int blend;
int ghost_blend;
int alphaBlendCounter;
int changeBlending;

//Which state
int state;

//List of States
enum {SPLASH, INSTRUCTIONS, INSTRUCTIONS2, INSTRUCTIONS3, GAME, PAUSE, LOSE, WIN};

//Different Screens
void splash();
void game();
void instructions();
void instructions2();
void instructions3();
void lose();
void pause();

//State Machine
void goToSplash();
void goToGame();
void goToInstructions();
void goToInstructions2();
void goToInstructions3();
void goToPause();
void goToLose();

//Sound stuff
void setupSounds();
void playSoundA();
void playSoundB();
void pauseSound();
void unpauseSound();
void stopSound();

//Interrupt stuff
void setupInterrupts();
void interruptHandler();

void hideSprites();
void clearObstacles();

int main()
{

	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	goToSplash();
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	setupSounds();
	setupInterrupts();

	playSoundA(backgroundSong, BACKGROUNDSONGLEN, BACKGROUNDSONGFREQ, 1);


	while(1)
	{
		oldButtons = buttons;
		buttons = BUTTONS;

		switch(state) {
			case SPLASH:
				splash();
				break;
			case INSTRUCTIONS:
				instructions();
				break;
			case INSTRUCTIONS2:
				instructions2();
				break;
			case INSTRUCTIONS3:
				instructions3();
				break;								
			case GAME:
				game();
				break;
			case PAUSE:
				pause();
				break;
			case LOSE:
				lose();
				break;
		}

		waitForVblank();
	}

	return 0;

}


void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void setupInterrupts()
{
	REG_IME = 0;

	REG_INTERRUPT = (unsigned int) interruptHandler;

	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler()
{
	REG_IME = 0;
	if(REG_IF & INT_VBLANK)
	{

		if(soundA.isPlaying)
		{
			soundA.vbCount++;
			if(soundA.vbCount >= soundA.duration)
			{
				if(soundA.loops)
				{
					playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
				} else {
					dma[1].cnt = 0;
					soundA.isPlaying = 0;
					REG_TM0CNT = 0;
				}
			}
		}

		if(soundB.isPlaying)
		{
			soundB.vbCount++;
			if(soundB.vbCount >= soundB.duration)
			{
				if(soundB.loops)
				{
					playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
				} else {
					dma[2].cnt = 0;
					soundB.isPlaying = 0;
					REG_TM1CNT = 0;
				}
			}
		}		

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}

void playSoundA(const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundA.data = sound;
        soundA.vbCount = 0;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
        soundA.isPlaying = 1;
        soundA.loops = loops;
        soundA.frequency = frequency;
        soundA.length = length;
         
}

void playSoundB(const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
	
        soundB.data = sound;
        soundB.vbCount = 0;
        soundB.duration = ((VBLANK_FREQ*length)/frequency);
        soundB.isPlaying = 1;
        soundB.loops = loops;
        soundB.frequency = frequency;
        soundB.length = length;

}

void pauseSound()
{
	soundA.isPlaying = 0;
	REG_TM0CNT = 0;

	soundB.isPlaying = 0;
	REG_TM1CNT = 0;	
}

void unpauseSound()
{
	soundA.isPlaying = 1;
	REG_TM0CNT = TIMER_ON;

	soundB.isPlaying = 1;
	REG_TM1CNT = TIMER_ON;
}

void stopSound()
{
    dma[1].cnt = 0;
    soundA.isPlaying = 0;
    REG_TM0CNT = 0;

    dma[2].cnt = 0;
    soundB.isPlaying = 0;
    REG_TM1CNT = 0;
}

void hideSprites()
{
	for(int i = 0; i < 128; i++)
	{
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
}

void initializeGame()
{
	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	hOff = 0;
	vOff = 0;

	spongebob.width = 32;
	spongebob.height = 32;
	spongebob.rdel = 1;
	spongebob.cdel = 1;
	spongebob.row = SHIFTUP(120);
	spongebob.col = 30;
	spongebob.isJumping = 0;
	spongebob.maxRSpeed = SHIFTUP(8);
	spongebob.racc = 30;
	spongebob.currFrame = 1;
	spongebob.aniState = 0;
	spongebob.active = 1;
	spongebob.invincible = 0;

	plusFive.active = 0;
	plusFive.width = 16;
	plusFive.height = 16;

	heart.width = 16;
	heart.height = 16;
	heart.aniState = 0;

	avoidedObstacles = 0;
	health = 5;
	cheat = 0;


	for(int i = 0; i < MAXOBSTACLES; i++)
	{
		obstacles[i].active = 0;
		obstacles[i].width = 16;
		obstacles[i].height = 16;
		obstacles[i].currFrame = 0;

		jellyfish[i].active = 0;
		jellyfish[i].width = 16;
		jellyfish[i].height = 16;
		jellyfish[i].caught = 0;
		jellyfish[i].currFrame = 0;

		obstacles2[i].active = 0;
		obstacles2[i].width = 16;
		obstacles2[i].height = 16;
		obstacles2[i].currFrame = 0;

	}

	timer = 0;
	pinkObstacleTime = 75;
	blueObstacleTime = 95;
	greenObstacleTime = 100;
	caughtFish = 0;
	tempTimer = 0;

	//Alpha Blending Stuff
	blend = 0;
	ghost_blend = 16;
	alphaBlendCounter = 0;
	changeBlending = 5;


}

void update()
{
	//Every 75 frames a jellyfish/obstacle will spawn
	//Make it harder after X frames
	timer++;

	//ALPHA BLEDNING code
	//Want to make GREEN JELLYFISH Alpha Blend
	if(++alphaBlendCounter % changeBlending == 0)
	{
		ghost_blend--;
		if(ghost_blend < 0)
		{
			ghost_blend = 16;
		}

		REG_COLEV = WEIGHTOFA(ghost_blend) | WEIGHTOFB(16 - ghost_blend);
	}

	//PINK JELLYFISH
	if(timer % pinkObstacleTime == 0)
	{
		for(int i = 0; i < MAXOBSTACLES; i++)
		{
			if(!jellyfish[i].active)
			{
				spawnObstacle(&jellyfish[i]);
				break;
			}
		}
	}	


	//BLUE JELLYFISH
	//They come out after PINK JELLYFISH and when timer has reached 1700
	if(timer > 1700)
	{
		if(timer % blueObstacleTime == 0)
		{
			for(int i = 0; i < MAXOBSTACLES; i++)
			{
				if(!obstacles[i].active && !spongebob.invincible)
				{
					//Blue Jellyfish stop spawning while spongebob invincible
					spawnObstacle(&obstacles[i]);
					break;
				}
			}
		}
	}


	//GREEN JELLYFISH - Their behavior is Alpha Blending
	//They come out after BLUE JELLYFISH and when timer has reached 3400
	if(timer > 3400)
	{
		if(timer % greenObstacleTime == 0)
		{
			for(int i = 0; i < MAXOBSTACLES; i++)
			{
				//Green Jellyfish stop spawning while spongebob invincible
				if(!obstacles2[i].active && !spongebob.invincible)
				{
					spawnObstacle(&obstacles2[i]);
					break;
				}
			}
		}	
	}

	//Scrolls through background and moves sprite
	//Update Player movements
	updateSpongebob(&spongebob);

	hOff++; //Keeps the screen moving

	REG_BG0HOFS = hOff/2;
	REG_BG1HOFS = hOff/4;

	//Checks if player is off screen bounds
	if(playerOffScreen(&spongebob))
	{
		goToLose();
	}

	//Make Spongebob FLASH when he gets hit
	//While he is flashing he is INVINCIBLE
	if(tempTimer > 0)
	{
		if(tempTimer % 5 == 0)
		{
			spongebob.active = 0;
		} else {
			spongebob.active = 1;
		}

		tempTimer--;
	} else {
		spongebob.invincible = 0;
		stop = 0;
		heart.aniState = 0;
	}

	
	for(int i = 0; i < MAXOBSTACLES; i++)
	{
		//Updates the PINK JELLYFISH
		if(jellyfish[i].active)
		{
			updateObstacle(&jellyfish[i]);

			//Player should catch them
			//Button A throws the net
			if(catchJellyfish(&spongebob, &jellyfish[i]) && spongebob.aniState == 8) 
			{
				caughtFish = caughtFish + 5;
				plusFive.active = 1;
				plusFive.row = SHIFTDOWN(spongebob.row) - 12;
				plusFive.col = spongebob.col - 4;

				//He laughs when he catches the first jellyfish
				//I only did this once so it is not annoying
				if(caughtFish == 5)
				{
					playSoundB(laugh, LAUGHLEN, LAUGHFREQ, 0);
				}
				
				//Makes jellyfish disappear when caught
				jellyfish[i].active = 0;
			} 
		}


		//Updates the BLUE JELLYFISH and checks for collisions
		if(obstacles[i].active)
		{
			updateObstacle(&obstacles[i]);

			//Player collides and loses heart
			//Collision is only checked in spongebob not "invincible"
			if(playerCollide(&spongebob, &obstacles[i]) && !spongebob.invincible)
			{
				health--;
				spongebob.invincible = 1;

				tempTimer = 180;

				if(health == 0)
				{
					goToLose();
				}
				
			} 
		}

		//Updates the GREEN JELLYFISH and checks for collisions
		if(obstacles2[i].active)
		{
			updateObstacle(&obstacles2[i]);

			//Player collides and loses heart
			//Collision is only checked in spongebob not "invincible"
			if(playerCollide(&spongebob, &obstacles2[i]) && !spongebob.invincible)
			{
				health--;
				spongebob.invincible = 1;

				tempTimer = 180;

				if(health == 0)
				{
					goToLose();
				}
			}
		}

		clearObstacles();
	}

	//Updates to move the "+5" up
	updatePlusFive(&plusFive);
}

//Used when jellys are caught or go off the screen
//Pink Jellyfish are not active when caught or off screen
//Blue and Green Jellyfish are not active when off screen
void clearObstacles()
{
	for(int i = 0; i < MAXOBSTACLES; i++)
	{
		OBSTACLE* obs = &obstacles[i];
		OBSTACLE* jelly = &jellyfish[i];
		OBSTACLE* obs2 = &obstacles2[i];

		if(!(obs->active))
		{
			shadowOAM[ENEMY + i].attr0 = ATTR0_HIDE;
		}

		if(!(jelly->active))
		{
			shadowOAM[JELLYFISH + i].attr0 = ATTR0_HIDE;
		}

		if(!(obs2->active))
		{
			shadowOAM[JELLYFISH2 + i].attr0 = ATTR0_HIDE;
		}
	}
}


void draw()
{
	//Drawing Player/Spongebob
	//Hide him for FLASHING purposes
	if(spongebob.active)
	{
		updatePlayerOAM(&spongebob);
	} else {
		shadowOAM[PLAYER].attr0 = ATTR0_HIDE;
	}

	//Drawing Jellyfish
	//Obs - Blue Jellyfish
	//Jelly - Pink Jellyfish (catch these)
	//Obs2 - Green Jellyfish
	for(int i = 0; i < MAXOBSTACLES; i++)
	{
		OBSTACLE* obs = &obstacles[i];
		OBSTACLE* jelly = &jellyfish[i];
		OBSTACLE* obs2 = &obstacles2[i];

		if(obs->active)
		{
			updateObstacleOAM(obs, i);
		}

		if(jelly->active)
		{
			updateJellyfishOAM(jelly, i);
		}

		if(obs2->active)
		{
			updateObstacle2OAM(obs2, i);
		}

	}

	//Update/draw Spongebob's health/hearts
	updateHealthOAM(health);

	//Update/draw Spongebob's score
	updateScoreOAM(caughtFish);

	//Update/draw "+5" above Spongebob
	//Put in the addFive sprite
	updatePlusFiveOAM(&plusFive);
	
	DMANow(3, shadowOAM, OAM, 128*4);
}


//*************************ACTIVATING STATES**********************//
//****************************************************************//
void splash()
{
	if(BUTTON_PRESSED(BUTTON_START))
	{
		goToGame();
	}

	if(BUTTON_PRESSED(BUTTON_SELECT))
	{
		goToInstructions();
	}
}

void instructions()
{
	if(BUTTON_PRESSED(BUTTON_START))
	{
		goToGame();
	}

	if(BUTTON_PRESSED(BUTTON_SELECT))
	{
		goToInstructions2();
	}
}

void instructions2()
{
	if(BUTTON_PRESSED(BUTTON_START))
	{
		goToGame();
	}

	if(BUTTON_PRESSED(BUTTON_SELECT))
	{
		goToInstructions3();
	}	
}

void instructions3()
{
	if(BUTTON_PRESSED(BUTTON_START))
	{
		goToGame();
	}
}

//Level 1
void game()
{
	update();

	if(state == GAME)
	{
		draw();
	}
	

	if(BUTTON_PRESSED(BUTTON_SELECT))
	{
		goToPause();
	}

	//CHEAT - gives spongebob back his health
	//Can ONLY use the cheat one time
	if(BUTTON_PRESSED(BUTTON_B) && !cheat)
	{
		health = 5;
		cheat = 1;
	}

}

void pause()
{

	if(BUTTON_PRESSED(BUTTON_SELECT))
	{
		goToGame();
	}

	//Restart the game
	if(BUTTON_PRESSED(BUTTON_START))
	{
		goToSplash();
	}
}

void lose()
{
	if(BUTTON_PRESSED(BUTTON_START))
	{
		goToSplash();
	}
}


//*************************GO TO STATES***************************//
//****************************************************************//
void goToSplash()
{

	REG_BG0HOFS = 0;
	REG_BG1HOFS = 0;

	REG_BLDMOD = 0;
    REG_COLEV = 0;

	initializeGame();
	state = SPLASH;

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0 | COLOR256;
	loadPalette(splashPal);
	DMANow(3, splashTiles, &CHARBLOCKBASE[0], splashTilesLen/2);
	DMANow(3, splashMap, &SCREENBLOCKBASE[31], splashMapLen/2);


}

void goToGame()
{
	//Alpha Blending Registers
	//Use BG1_B and BG0_B to blend in both backgrounds
	REG_BLDMOD = BG1_B | BG0_B | OBJ_B | BACKDROP_B | NORMAL_TRANS;

	REG_BG0HOFS = hOff/2;
	REG_BG1HOFS = hOff/4;

	//Sprite Sheet
	DMANow(3, spritesTiles, &CHARBLOCKBASE[4], spritesTilesLen/2);
	DMANow(3, spritesPal, SPRITE_PALETTE, 256);

	//Overlapping "hooks" and "sea" backgrounds
	//Both size 256x256
	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0;
	REG_BG1CNT = CBB(1) | SBB(27) | BG_SIZE0;

	loadPalette(hooksPal);
	DMANow(3, hooksTiles, &CHARBLOCKBASE[0], hooksTilesLen/2);
	DMANow(3, hooksMap, &SCREENBLOCKBASE[31], hooksMapLen/2);

	DMANow(3, seaTiles, &CHARBLOCKBASE[1], seaTilesLen/2);
	loadMap(seaMap, seaMapLen, 0, 27);

	state = GAME;

}

void goToInstructions()
{

	REG_BG0HOFS = 0;
	REG_BG1HOFS = 0;

	REG_BLDMOD = 0;
    REG_COLEV = 0;

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0;

	loadPalette(instructionsPal);
	DMANow(3, instructionsTiles, &CHARBLOCKBASE[0], instructionsTilesLen/2);
	DMANow(3, instructionsMap, &SCREENBLOCKBASE[31], instructionsMapLen/2);

	state = INSTRUCTIONS;

}

void goToInstructions2()
{
	REG_BG0HOFS = 0;
	REG_BG1HOFS = 0;

	REG_BLDMOD = 0;
    REG_COLEV = 0;

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0;

	loadPalette(instructions2Pal);
	DMANow(3, instructions2Tiles, &CHARBLOCKBASE[0], instructions2TilesLen/2);
	DMANow(3, instructions2Map, &SCREENBLOCKBASE[31], instructions2MapLen/2);

	state = INSTRUCTIONS2;
}

void goToInstructions3()
{
	REG_BG0HOFS = 0;
	REG_BG1HOFS = 0;

	REG_BLDMOD = 0;
    REG_COLEV = 0;

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0;

	loadPalette(instructions3Pal);
	DMANow(3, instructions3Tiles, &CHARBLOCKBASE[0], instructions3TilesLen/2);
	DMANow(3, instructions3Map, &SCREENBLOCKBASE[31], instructions3MapLen/2);

	state = INSTRUCTIONS3;
}


void goToPause()
{

	REG_BG0HOFS = 0;
	REG_BG1HOFS = 0;

	REG_BLDMOD = 0;
    REG_COLEV = 0;

	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0;

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	loadPalette(pausePal);
	DMANow(3, pauseTiles, &CHARBLOCKBASE[0], pauseTilesLen/2);
	DMANow(3, pauseMap, &SCREENBLOCKBASE[31], pauseMapLen/2);

	state = PAUSE;

}

void goToLose()
{

	REG_BG0HOFS = 0;
	REG_BG1HOFS = 0;

	REG_BLDMOD = 0;
    REG_COLEV = 0;

	REG_BG0CNT = CBB(0) | SBB(31) | BG_SIZE0 | COLOR256;

	hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	loadPalette(losePal);
	DMANow(3, loseTiles, &CHARBLOCKBASE[0], loseTilesLen/2);
	DMANow(3, loseMap, &SCREENBLOCKBASE[31], loseMapLen/2);

	state = LOSE;

}










