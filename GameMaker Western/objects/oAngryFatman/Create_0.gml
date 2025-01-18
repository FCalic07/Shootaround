// Inherit the parent event
event_inherited();

// Basic properties
hp = 500;
spd = 0; // Enemy is stationary
dir = 0;
face = 0;

// Shooting properties
shoot_interval = 12; // Time between bullets (60 bullets/min = 1 bullet/sec)
shoot_duration = 900; // Shooting lasts for 9 seconds
cooldown_time = 400; // Cooldown lasts for 4 seconds

shoot_timer = 0; // Timer for bullet intervals
state_timer = 0; // Tracks how long in the current state

// Bullet instance
bulletInst = noone;

// State machine
state = 0; // 0 = Shooting, 1 = Cooldown

sprite[0] = sAngryFatman;
sprite[1] = sAngryFatmanShooting;

soundTimer = 0;
soundStage = 0;