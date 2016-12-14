
//{{BLOCK(game)

//======================================================================
//
//	game, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 106 tiles (t|f|p reduced) not compressed
//	+ regular map (flat), not compressed, 32x32 
//	Total size: 512 + 3392 + 2048 = 5952
//
//	Time-stamp: 2016-10-30, 21:39:29
//	Exported by Cearn's GBA Image Transmogrifier
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAME_H
#define GRIT_GAME_H

#define gameTilesLen 3392
extern const unsigned short gameTiles[1696];

#define gameMapLen 2048
extern const unsigned short gameMap[1024];

#define gamePalLen 512
extern const unsigned short gamePal[256];

#endif // GRIT_GAME_H

//}}BLOCK(game)
