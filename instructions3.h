
//{{BLOCK(instructions3)

//======================================================================
//
//	instructions3, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 250 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 8000 + 2048 = 10560
//
//	Time-stamp: 2016-12-06, 13:56:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS3_H
#define GRIT_INSTRUCTIONS3_H

#define instructions3TilesLen 8000
extern const unsigned short instructions3Tiles[4000];

#define instructions3MapLen 2048
extern const unsigned short instructions3Map[1024];

#define instructions3PalLen 512
extern const unsigned short instructions3Pal[256];

#endif // GRIT_INSTRUCTIONS3_H

//}}BLOCK(instructions3)
