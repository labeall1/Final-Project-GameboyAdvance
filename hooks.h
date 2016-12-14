
//{{BLOCK(hooks)

//======================================================================
//
//	hooks, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 332 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10624 + 2048 = 13184
//
//	Time-stamp: 2016-12-13, 12:37:45
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HOOKS_H
#define GRIT_HOOKS_H

#define hooksTilesLen 10624
extern const unsigned short hooksTiles[5312];

#define hooksMapLen 2048
extern const unsigned short hooksMap[1024];

#define hooksPalLen 512
extern const unsigned short hooksPal[256];

#endif // GRIT_HOOKS_H

//}}BLOCK(hooks)
