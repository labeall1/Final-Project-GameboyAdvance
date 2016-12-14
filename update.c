#include "myLib.h"
#include <stdio.h>
#include <stdlib.h>

extern int vOff;
extern int hOff;

int aniCounter = 0;
int obCounter = 0;

extern volatile unsigned int buttons, oldButtons;

//Spongebob states
enum {SPONGE, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, ELEVEN};

void updateSpongebob(SPRITE *spongebob)
{
    aniCounter++;

    //ANIMATION STUFF

    //Spongebob is running
    if(aniCounter % 17 == 0 && SHIFTDOWN(spongebob->row) > 110 && spongebob->aniState == 0)
    {
        if(spongebob->currFrame == 1) {
            spongebob->currFrame = 2;
        } else if(spongebob->currFrame == 2) {
            spongebob->currFrame = 3;
        } else {
            spongebob->currFrame = 1;
        }     
    }

    //Freezes spongebob in the state
    //When he is jumping
    if(SHIFTDOWN(spongebob->row) < 110 && spongebob->aniState == 0)
    {
        spongebob->currFrame = 2;
    }


    //Animated Jellyfish net
    if(BUTTON_PRESSED(BUTTON_A))
    {
        //Immediately goes to Net phase
        spongebob->aniState = 8;
        spongebob->currFrame = 0;
    }

    //Animate Jellyfish net annimation
    if(spongebob->aniState == 8 && aniCounter % 20 == 0)
    {
        if(spongebob->currFrame == 0) {
            spongebob->currFrame = 1;   
        } else {
            spongebob->aniState = 0;
            spongebob->currFrame = 1;
        }
    }   


    //This controls spongebob's jumping abilities
    spongebob->isJumping = 0;

    if(BUTTON_PRESSED(BUTTON_UP))
    {
        spongebob->isJumping = 1;
        spongebob->rdel = -600;
    }

    if(SHIFTDOWN(spongebob->row) + spongebob->height < 160 || spongebob->isJumping)
    {
        spongebob->rdel += spongebob->racc;
        spongebob->row += spongebob->rdel;
    }


    if(SHIFTDOWN(spongebob->row) > 120)
    {
        spongebob->row = SHIFTUP(120);
    }

}

//Otherwise spongebob gets hit
int playerCollide(SPRITE *player, OBSTACLE *obstacle)
{
    //Calculating values to do collision logic
    int obstacleTop = obstacle->row + 10;
    int obstacleBottom = obstacle->row + 16;

    int playerBottom = SHIFTDOWN(player->row) + 28;
    int playerTop = SHIFTDOWN(player->row) + 8;

    int obstacleRight = obstacle->col + 12;
    int obstacleLeft = obstacle->col + 4;

    int playerRight = player->col + player->width - 8;
    int playerLeft = player->col + 4;

    //First 2 - if player under or same as enemy
    //Checks if player lands on top
    if(playerRight == obstacleLeft && (obstacleBottom <= playerBottom) && (obstacleBottom > playerTop))
    {
        obstacle->currFrame = 4;
        return 1; //Player Lost
    }

    //Checks if player is hit by obstacle on top
    if(playerTop == obstacleBottom && (obstacleRight > playerLeft) && (obstacleLeft < playerRight))
    {
        obstacle->currFrame = 4;
        return 1; //Player Lost
    }

    //Last 2 - if player above enemy
    //Checking left side of obstacle
    if(playerRight == obstacleLeft && (obstacleTop <= playerBottom) && (obstacleTop > playerTop))
    {
        obstacle->currFrame = 4;
        return 1; //Player Lost
    }

    if(playerBottom == obstacleTop && (obstacleRight > playerLeft) && (obstacleLeft < playerRight))
    {
        obstacle->currFrame = 4;
    	return 1; //Player Lost
    }

    return 0;
}

int catchJellyfish(SPRITE *player, OBSTACLE *obstacle)
{
    int netTop = SHIFTDOWN(player->row) + 12;
    int netBottom = SHIFTDOWN(player->row) + 24;

    int netLeft = player->col + 24;
    int netRight = player->col + 28;

    int obstacleTop = obstacle->row;
    int obstacleBottom = obstacle->row + 14;

    int obstacleRight = obstacle->col + 12;
    int obstacleLeft = obstacle->col + 4;

    if(netRight == obstacleLeft && (obstacleBottom <= netBottom) && (obstacleBottom > netTop))
    {
        return 1; //Jellyfish caught
    }

    if(netTop == obstacleBottom && (obstacleRight > netLeft) && (obstacleLeft < netRight))
    {
        return 1; //Jellyfish caught
    }

    if(netRight == obstacleLeft && (obstacleTop <= netBottom) && (obstacleTop > netTop))
    {
        return 1; //Jellyfish caught
    }

    if(netBottom == obstacleTop && (obstacleRight > netLeft) && (obstacleLeft < netRight))
    {
        return 1; //Jellyfish caught
    }

    return 0;
}

int playerOffScreen(SPRITE *player)
{
    //Only detects going up off the page
    if(SHIFTDOWN(player->row) + player->height < 0)
    {
        return 1; //Player off screen
    }

    return 0;
}

//Updating the "+5" sprite allows it to move
//up the screen
void updatePlusFive(SPRITE* plusFive)
{
    plusFive->oldRow = plusFive->row;
    plusFive->oldCol = plusFive->col;
    plusFive->row--;

    if(plusFive->row <= 20)
    {
        plusFive->active = 0;
    }
}

//Jellyfish animation stuff below
void updateObstacle(OBSTACLE* obstacle)
{
    obCounter++;
	obstacle->oldRow = obstacle->row;
	obstacle->oldCol = obstacle->col;
	obstacle->col--;

	if(obstacle->col <= 0)
	{
		obstacle->active = 0;
	}

    if(obCounter % 23 == 0)
    {
        if(obstacle->currFrame == 0) {
            obstacle->currFrame = 2;
        } else {
            obstacle->currFrame = 0;
        }     
    } 
}


void spawnObstacle(OBSTACLE* obstacle)
{
	obstacle->active = 1;
	int random = (rand() % 90);
	obstacle->col = 240 - obstacle->width;
	obstacle->row = 130 - random;
}


