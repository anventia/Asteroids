// Brendan Chen
// 2021/10/01 
// Programming 12 Asteroids Project
// Uses some code from my utilities repository: https://github.com/anventia/ProcessingUtilities


// Core Variables //
int mode;  // Mode Framework
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

PFont MMD;  // Fonts

color[] smokeColors;

// Game Variables //
int score;
int lives;
Ship myShip;
ArrayList<gameObject> myObjects;

final int bigAsteroid = 200;
final int medAsteroid = 125;
final int smlAsteroid = 75;
final int tnyAsteroid = 50;
final int numAsteroids = 4;



void setup() {
  // Setup //
  mode = INTRO;
  size(1000,700);
  background(0);
  surface.setResizable(true);
  surface.setTitle("Asteroids");
  
  
  // Font //
  MMD = createFont("MajorMonoDisplay-Regular.ttf", 100);
  textFont(MMD);
  
  
  // Game //
  myShip = new Ship();
  myObjects = new ArrayList<gameObject>();
  myObjects.add(myShip);
  
  int i = 0;
  while(i < numAsteroids) {
    myObjects.add(new Asteroid(bigAsteroid, random(0-bigAsteroid/2, width+bigAsteroid/2), random(0-bigAsteroid/2, height+bigAsteroid/2)));
    i++;
  }
}

void draw() {
  // Core functions //
  scaleWindow();
  switch(mode) {
    case INTRO: intro(); break;
    case GAME:  game();  break;
  }
  
  
  // Game //
  
}
