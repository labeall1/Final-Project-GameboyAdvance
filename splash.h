
//{{BLOCK(splash)

//======================================================================
//
//	splash, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 192 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12288 + 2048 = 14848
//
//	Time-stamp: 2016-12-05, 16:27:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASH_H
#define GRIT_SPLASH_H

#define splashTilesLen 12288
extern const unsigned short splashTiles[6144];

#define splashMapLen 2048
extern const unsigned short splashMap[1024];

#define splashPalLen 512
extern const unsigned short splashPal[256];

#endif // GRIT_SPLASH_H

//}}BLOCK(splash)
