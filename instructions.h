
//{{BLOCK(instructions)

//======================================================================
//
//	instructions, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 335 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10720 + 2048 = 13280
//
//	Time-stamp: 2016-12-05, 16:55:13
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS_H
#define GRIT_INSTRUCTIONS_H

#define instructionsTilesLen 10720
extern const unsigned short instructionsTiles[5360];

#define instructionsMapLen 2048
extern const unsigned short instructionsMap[1024];

#define instructionsPalLen 512
extern const unsigned short instructionsPal[256];

#endif // GRIT_INSTRUCTIONS_H

//}}BLOCK(instructions)
