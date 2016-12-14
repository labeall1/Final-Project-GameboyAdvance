#include "myLib.h"

unsigned short *videoBuffer = (u16 *)0x6000000;

unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer =  (u16 *)0x600A000;

DMA *dma = (DMA *)0x40000B0;

void loadPalette(const unsigned short* palette)
{
	DMANow(3, (unsigned short*)palette, PALETTE, 256);
}

void DMANow(int channel, volatile const void* source, volatile void* destination, unsigned int control)
{
	dma[channel].src = source;
	dma[channel].dst = destination;
	dma[channel].cnt = DMA_ON | control;
}

void waitForVblank()
{
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

//This function is to be used ONLY IF we are setting up a map with a custom palette index
void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb)
{
	//We are editing the actual map data, so this array is what we are going to use to replace the existing oen
	unsigned short newMap[mapLen];

	//We are going to iterate through every entry in this new map, and edit the entry to use a custom palette
	for(int i = 0; i < mapLen; i++)
	{
		// Here we mask the value in the current spot so we don't lose information
		unsigned short mask = map[i] & ~(PALBANK(0xF));
		newMap[i] = mask | PALBANK(palIndex);
	}
	// Finally we DMA in the new map to the appropriate sbb
	DMANow(3, newMap, &SCREENBLOCKBASE[sbb], mapLen);
}
