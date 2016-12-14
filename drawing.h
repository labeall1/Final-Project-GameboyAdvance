#define MAXOBSTACLES 10

enum {PLAYER, ENEMY, JELLYFISH = ENEMY + MAXOBSTACLES, JELLYFISH2 = JELLYFISH + MAXOBSTACLES, 
	HEALTH = JELLYFISH2 + MAXOBSTACLES, SCORE = HEALTH + 10, JELLYFISH3 = SCORE + 10,
PLUSFIVE = JELLYFISH3 + 10};

void updateObstacleOAM();
void updatePlayerOAM();
void updateJellyfishOAM();
void updateObstacle2OAM();
void updateHealthOAM();
void updateScoreOAM();
void updatePlusFiveOAM();
int animateHealth();