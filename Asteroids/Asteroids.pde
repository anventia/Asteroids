// Brendan Chen
// 2021/10/01 
// Programming 12 Asteroids Project


// Core Variables //
int mode;  // Mode Framework
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

PFont MMD;  // Fonts


// Game Variables //
int score;


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
}

void draw() {
  scaleWindow();
  switch(mode) {
    case INTRO: intro(); break;
    case GAME:  game();  break;
  }
}
