
//{{BLOCK(sea)

//======================================================================
//
//	sea, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 145 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4640 + 2048 = 7200
//
//	Time-stamp: 2016-12-13, 12:46:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SEA_H
#define GRIT_SEA_H

#define seaTilesLen 4640
extern const unsigned short seaTiles[2320];

#define seaMapLen 2048
extern const unsigned short seaMap[1024];

#define seaPalLen 512
extern const unsigned short seaPal[256];

#endif // GRIT_SEA_H

//}}BLOCK(sea)
