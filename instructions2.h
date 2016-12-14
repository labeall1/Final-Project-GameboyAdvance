
//{{BLOCK(instructions2)

//======================================================================
//
//	instructions2, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 360 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11520 + 2048 = 14080
//
//	Time-stamp: 2016-12-05, 16:40:02
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS2_H
#define GRIT_INSTRUCTIONS2_H

#define instructions2TilesLen 11520
extern const unsigned short instructions2Tiles[5760];

#define instructions2MapLen 2048
extern const unsigned short instructions2Map[1024];

#define instructions2PalLen 512
extern const unsigned short instructions2Pal[256];

#endif // GRIT_INSTRUCTIONS2_H

//}}BLOCK(instructions2)
