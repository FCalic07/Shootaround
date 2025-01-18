// Inherit the parent event
event_inherited();

// Initialize variables
hp = 10;
spd = 0;
chaseSpd = 1.0;
dir = 0;
xspd = 0;
yspd = 0;

face = 1;

// State machine initialization
state = 0;

// Spawn state variables
fadeSpd = 1;
emergeSpd = 4;

// Shooting state variables (not used since you are switching to swing)
coolDownTime = 4 * 60;
shootTimer = irandom(coolDownTime);
windupTime = 60;
recoverTime = 45;
bulletInst = noone;

// Define the sprite for different directions
sprite[0] = sEagleEyeRightWalking;
sprite[1] = sEagleEyeLeftWalking;
sprite[2] = sEagleEyeDownWalking;

walkingSprite[0] = sEagleEyeRightWalking;
walkingSprite[1] = sEagleEyeLeftWalking;
walkingSprite[2] = sEagleEyeDownWalking;

// New variables for swinging behavior
swingRange = 5;  // Range within which the enemy can attack
swingDamage = 0.1;  // Damage dealt by the swing
sprite_attacking = sEagleEyeAttack;  // Your attacking/swing sprite
frameCounter =0;

path = path_add();
