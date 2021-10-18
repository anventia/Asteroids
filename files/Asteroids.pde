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


// Gif (glitch effect) //
PImage gif[];
int frames;
int loadFrame;


// Game Variables //
int score;
int goal;
int lives;
int invTimer;
int ufoTimer;
boolean win;
boolean gameend;
boolean hit;

Ship myShip;
ArrayList<gameObject> myObjects;

final int bigAsteroid = 200;  // Asteroids
final int medAsteroid = 125;
final int smlAsteroid = 75;
final int tnyAsteroid = 50;

final int numAsteroids = 4;
final int numSizes = 4;


void setup() {
  // Setup //
  mode = INTRO;
  size(1000,700, P2D);
  background(0);
  //surface.setResizable(true);
  surface.setTitle("Asteroids");
   
  
  // Font //
  MMD = createFont("MajorMonoDisplay-Regular.ttf", 100);
  textFont(MMD);
  
  
  // Colors //
  smokeColors = new color[]{
    #FF1717,
    #FF7417, 
    #FFB617, 
    #FFE817,
    #EFFF17
  };
  
  
  // Gif //
  frames = 243;
  gif = new PImage[frames];
  int i = 0;
  while (i < frames) {
    String k = ""+i;  // Converts to string
    gif[i] = loadImage("frame"+k+".gif"); 
    i ++;
  }
  loadFrame = int(random(0,frames+1));  // start gif animation at random place
  
  
  // Game //
  goal = int(numAsteroids * (pow(2, numSizes)-1));  // Calculates total number of asteroids that will appear
  initGame();
}


// Initialize game //
void initGame() {
  myObjects = new ArrayList<gameObject>();  // Game Objects
  myShip = new Ship();  // Add Ship
  myObjects.add(myShip);
  
  score = 0;
  myShip.lives = 3;
  invTimer = 0;
  ufoTimer = 0;
  hit = false;
  
  introY1 = 0;  // Reset intro animations
  introY2 = 0;
  introX3 = 18;
  introY3 = 88;
  introS3 = 0.6;

  
  int i = 0;  // Add Asteroids
  while(i < numAsteroids) {
    myObjects.add(new Asteroid(bigAsteroid, random(0-bigAsteroid/2, width+bigAsteroid/2), random(0-bigAsteroid/2, height+bigAsteroid/2)));
    i++;
  }
}

void draw() {
  // Core functions //
  scaleWindow();
  switch(mode) {
    case INTRO:    intro();    break;
    case GAME:     game();     break;
    case PAUSE:    pause();    break;
    case GAMEOVER: gameOver(); break;
  }
}
