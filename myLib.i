# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
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
# 2 "myLib.c" 2

unsigned short *videoBuffer = (u16 *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer = (u16 *)0x600A000;

DMA *dma = (DMA *)0x40000B0;

void loadPalette(const unsigned short* palette)
{
 DMANow(3, (unsigned short*)palette, ((u16 *)0x5000000), 256);
}

void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control)
{
 dma[channel].src = source;
 dma[channel].dst = destination;
 dma[channel].cnt = (1 << 31) | control;
}

void waitForVblank()
{
 while(*(volatile u16 *)0x4000006 > 160);
 while(*(volatile u16 *)0x4000006 < 160);
}


void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb)
{

 unsigned short newMap[mapLen];


 for(int i = 0; i < mapLen; i++)
 {

  unsigned short mask = map[i] & ~(((0xF) << 12));
  newMap[i] = mask | ((palIndex) << 12);
 }

 DMANow(3, newMap, &((screenblock *)0x6000000)[sbb], mapLen);
}
