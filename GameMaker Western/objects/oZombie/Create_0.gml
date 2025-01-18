// Inherit the parent event
event_inherited();
hp = 10;
spd = 0;
chaseSpd = 1.9;
dir = 0;
xspd =0;
yspd =0;


face = 1;

//state machine
state = 0;
//spawn state
fadeSpd = 1;
emergeSpd = 4;

//shooting state
coolDownTime = 4*60;
shootTimer =irandom(coolDownTime);
windupTime =60;
recoverTime =45;
bulletInst =noone;

sprite[0] = sEnemyRight;
sprite[1] = sEnemyLeft;
sprite[2] = sEnemyDown;

walkingSprite[0] = sEnemyRightWalking;
walkingSprite[1] = sEnemyLeftWalking;
walkingSprite[2] = sEnemyDownWalking;


