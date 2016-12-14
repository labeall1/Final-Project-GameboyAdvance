
//{{BLOCK(lose)

//======================================================================
//
//	lose, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 557 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 35648 + 2048 = 38208
//
//	Time-stamp: 2016-11-15, 15:45:33
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSE_H
#define GRIT_LOSE_H

#define loseTilesLen 35648
extern const unsigned short loseTiles[17824];

#define loseMapLen 2048
extern const unsigned short loseMap[1024];

#define losePalLen 512
extern const unsigned short losePal[256];

#endif // GRIT_LOSE_H

//}}BLOCK(lose)
