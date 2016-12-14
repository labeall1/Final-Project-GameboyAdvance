#include "myLib.h"
#include "drawing.h"

extern OBJ_ATTR shadowOAM[128];

//ShadowOAM Values

void updatePlayerOAM(SPRITE *spongebob)
{

	//AniState is whether he is running or jumping
	//0 - Running
	//8 - Jumping

	shadowOAM[PLAYER].attr0 = (SHIFTDOWN(spongebob->row) & ROWMASK) | ATTR0_SQUARE | ATTR0_8BPP;
	shadowOAM[PLAYER].attr1 = (spongebob->col & COLMASK) | ATTR1_SIZE32;
	shadowOAM[PLAYER].attr2 = SPRITEOFFSET16(spongebob->currFrame*4, spongebob->aniState);

}

//Update the PINK Jellyfish (catchable ones)
void updateJellyfishOAM(OBSTACLE* jellyfish, int i)
{
	shadowOAM[JELLYFISH + i].attr0 = (jellyfish->row & ROWMASK) | ATTR0_SQUARE | ATTR0_8BPP;
	shadowOAM[JELLYFISH + i].attr1 = (jellyfish->col & COLMASK) | ATTR1_SIZE16; 
	shadowOAM[JELLYFISH + i].attr2 = SPRITEOFFSET16(jellyfish->currFrame, 16);
}

//Update the BLUE Jellyfish
void updateObstacleOAM(OBSTACLE* obstacle, int i)
{
	shadowOAM[ENEMY + i].attr0 = (obstacle->row & ROWMASK) | ATTR0_SQUARE | ATTR0_8BPP;
	shadowOAM[ENEMY + i].attr1 = (obstacle->col & COLMASK) | ATTR1_SIZE16;
	shadowOAM[ENEMY + i].attr2 = SPRITEOFFSET16(obstacle->currFrame, 20);
}

//Update the GREEN Jellyfish
void updateObstacle2OAM(OBSTACLE* obs2, int i)
{
	//Use ATTR0_BLEND to enable Alpha Blending for GREEN JELLYFISH
	shadowOAM[JELLYFISH2 + i].attr0 = (obs2->row & ROWMASK) | ATTR0_SQUARE | ATTR0_8BPP | ATTR0_BLEND;
	shadowOAM[JELLYFISH2 + i].attr1 = (obs2->col & COLMASK) | ATTR1_SIZE16;
	shadowOAM[JELLYFISH2 + i].attr2 = SPRITEOFFSET16(obs2->currFrame, 24);
}

void updateHealthOAM(int i)
{
    int totalHearts = i;
 
    for(int i = 0; i < totalHearts; i++)
    {
        shadowOAM[HEALTH + i].attr0 = (0) | ATTR0_SQUARE | ATTR0_8BPP;
        shadowOAM[HEALTH + i].attr1 = (16*i & COLMASK) | ATTR1_SIZE16;
        shadowOAM[HEALTH + i].attr2 = SPRITEOFFSET16(16, 0);    
    }
 
    for(int i = totalHearts; i < 10; i++)
    {
        shadowOAM[HEALTH + i].attr0 = ATTR0_HIDE;
    }
}


//The "+5" Sprite appears over Spongebob
void updatePlusFiveOAM(SPRITE* plusFive)
{
	if(plusFive->active)
	{
		shadowOAM[PLUSFIVE].attr0 = (plusFive->row & ROWMASK) | ATTR0_SQUARE | ATTR0_8BPP;
		shadowOAM[PLUSFIVE].attr1 = (plusFive->col & COLMASK)| ATTR1_SIZE16;
		shadowOAM[PLUSFIVE].attr2 = SPRITEOFFSET16(28, 0);
	} else {
		shadowOAM[PLUSFIVE].attr0 = ATTR0_HIDE;
	}

}

void updateScoreOAM(int score)
{
    int hundreds = score / 100;
    int tens = (score / 10) - (hundreds*10);
    int ones = score - (tens*10) - (hundreds*100);
 
    shadowOAM[SCORE + 1].attr0 = 0 | ATTR0_SQUARE | ATTR0_8BPP;
    shadowOAM[SCORE + 1].attr1 = 215 | ATTR1_SIZE8;
    shadowOAM[SCORE + 1].attr2 = SPRITEOFFSET16(hundreds+18,0);
 
 
    shadowOAM[SCORE + 2].attr0 = 0 | ATTR0_SQUARE | ATTR0_8BPP;
    shadowOAM[SCORE + 2].attr1 = 223 | ATTR1_SIZE8;
    shadowOAM[SCORE + 2].attr2 = SPRITEOFFSET16(tens+18,0);
 
    shadowOAM[SCORE + 3].attr0 = 0 | ATTR0_SQUARE | ATTR0_8BPP;
    shadowOAM[SCORE + 3].attr1 = 231 | ATTR1_SIZE8;
    shadowOAM[SCORE + 3].attr2 = SPRITEOFFSET16(ones+18,0);
}







