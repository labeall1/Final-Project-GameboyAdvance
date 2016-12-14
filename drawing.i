# 1 "drawing.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "drawing.c"
# 1 "myLib.h" 1
typedef unsigned char u8;
typedef unsigned int u32;
# 13 "myLib.h"
typedef unsigned short u16;
# 52 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void loapMap();
void initialize();

void waitForVblank();

void goToStart();
void goToGame();
void goToPause();
void goToLose();
void goToWin();

void start();
void game();
void pause();
void lose();
void win();
# 121 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 160 "myLib.h"
enum {IDLE, CHASE, FLEE};
# 257 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 349 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int rdel;
 int cdel;
 int width;
 int height;
    int hide;
    int isJumping;
    int racc;
    int maxRSpeed;
    int currFrame;
    int aniState;
    int active;
    int invincible;

} SPRITE;

typedef struct
{
 int row;
 int col;
 int oldRow;
 int oldCol;
 int height;
 int width;
 int active;
 int cdel;
 int rdel;
 int clearFlag;
 int caught;
    int currFrame;
} OBSTACLE;

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
} SOUND;
# 2 "drawing.c" 2
# 1 "drawing.h" 1


enum {PLAYER, ENEMY, JELLYFISH = ENEMY + 10, JELLYFISH2 = JELLYFISH + 10,
 HEALTH = JELLYFISH2 + 10, SCORE = HEALTH + 10, JELLYFISH3 = SCORE + 10,
PLUSFIVE = JELLYFISH3 + 10};

void updateObstacleOAM();
void updatePlayerOAM();
void updateJellyfishOAM();
void updateObstacle2OAM();
void updateHealthOAM();
void updateScoreOAM();
void updatePlusFiveOAM();
int animateHealth();
# 3 "drawing.c" 2

extern OBJ_ATTR shadowOAM[128];



void updatePlayerOAM(SPRITE *spongebob)
{





 shadowOAM[PLAYER].attr0 = (((spongebob->row) >> 8) & 0xFF) | (0 << 14) | (1 << 13);
 shadowOAM[PLAYER].attr1 = (spongebob->col & 0x1FF) | (2 << 14);
 shadowOAM[PLAYER].attr2 = (spongebob->currFrame*4)*32+(spongebob->aniState);

}


void updateJellyfishOAM(OBSTACLE* jellyfish, int i)
{
 shadowOAM[JELLYFISH + i].attr0 = (jellyfish->row & 0xFF) | (0 << 14) | (1 << 13);
 shadowOAM[JELLYFISH + i].attr1 = (jellyfish->col & 0x1FF) | (1 << 14);
 shadowOAM[JELLYFISH + i].attr2 = (jellyfish->currFrame)*32+(16);
}


void updateObstacleOAM(OBSTACLE* obstacle, int i)
{
 shadowOAM[ENEMY + i].attr0 = (obstacle->row & 0xFF) | (0 << 14) | (1 << 13);
 shadowOAM[ENEMY + i].attr1 = (obstacle->col & 0x1FF) | (1 << 14);
 shadowOAM[ENEMY + i].attr2 = (obstacle->currFrame)*32+(20);
}


void updateObstacle2OAM(OBSTACLE* obs2, int i)
{

 shadowOAM[JELLYFISH2 + i].attr0 = (obs2->row & 0xFF) | (0 << 14) | (1 << 13) | (1 << 10);
 shadowOAM[JELLYFISH2 + i].attr1 = (obs2->col & 0x1FF) | (1 << 14);
 shadowOAM[JELLYFISH2 + i].attr2 = (obs2->currFrame)*32+(24);
}

void updateHealthOAM(int i)
{
    int totalHearts = i;

    for(int i = 0; i < totalHearts; i++)
    {
        shadowOAM[HEALTH + i].attr0 = (0) | (0 << 14) | (1 << 13);
        shadowOAM[HEALTH + i].attr1 = (16*i & 0x1FF) | (1 << 14);
        shadowOAM[HEALTH + i].attr2 = (16)*32+(0);
    }

    for(int i = totalHearts; i < 10; i++)
    {
        shadowOAM[HEALTH + i].attr0 = (2 << 8);
    }
}



void updatePlusFiveOAM(SPRITE* plusFive)
{
 if(plusFive->active)
 {
  shadowOAM[PLUSFIVE].attr0 = (plusFive->row & 0xFF) | (0 << 14) | (1 << 13);
  shadowOAM[PLUSFIVE].attr1 = (plusFive->col & 0x1FF)| (1 << 14);
  shadowOAM[PLUSFIVE].attr2 = (28)*32+(0);
 } else {
  shadowOAM[PLUSFIVE].attr0 = (2 << 8);
 }

}

void updateScoreOAM(int score)
{
    int hundreds = score / 100;
    int tens = (score / 10) - (hundreds*10);
    int ones = score - (tens*10) - (hundreds*100);

    shadowOAM[SCORE + 1].attr0 = 0 | (0 << 14) | (1 << 13);
    shadowOAM[SCORE + 1].attr1 = 215 | (0 << 14);
    shadowOAM[SCORE + 1].attr2 = (hundreds+18)*32+(0);


    shadowOAM[SCORE + 2].attr0 = 0 | (0 << 14) | (1 << 13);
    shadowOAM[SCORE + 2].attr1 = 223 | (0 << 14);
    shadowOAM[SCORE + 2].attr2 = (tens+18)*32+(0);

    shadowOAM[SCORE + 3].attr0 = 0 | (0 << 14) | (1 << 13);
    shadowOAM[SCORE + 3].attr1 = 231 | (0 << 14);
    shadowOAM[SCORE + 3].attr2 = (ones+18)*32+(0);
}
