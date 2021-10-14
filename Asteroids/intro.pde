

boolean fade = false;
int fadeCount = 0;
float introY1 = 0;
float introY2 = 0;
float introX3 = 18;
float introY3 = 88;
float introS3 = 0.6;
int smokeTimer = 0;
void intro() {
  
  // Text //
  fill(0);
  noStroke();
  rectMode(CENTER);
  rect(width/2,height/2-35*scaleY+introY1, 750,110);
  
  textAlign(CENTER);
  textSize(100*scaleY);
  fill(255);
  text("AsTeRoidS", width/2,height/2+introY1);  // Title text
    
  fill(0);
  noStroke();
  
  rectMode(CENTER);
  rect(width/2,height/2+83*scaleY+introY2, 370*scaleY,100*scaleY);
    
  fill(0);
  stroke(0);
  strokeWeight(2*scaleY);
  if(button(width/2,height/2+83*scaleY+introY2, 350*scaleY,75*scaleY, 2*scaleY, "stroke", 255, 0) && fade == false) {fade = true; fadeCount = 0;} else {mouseClick = false;}  // If button clicked, fade, then go to game mode
    
  fill(255);
  textSize(50*scaleY);
  text("- pl y -", width/2,height/2+100*scaleY+introY2);  // Play button text
  
  // Fade //
  if(fade && gameend == true) {  // Fade from gameOver screen
    shipAnimation();
    stroke(255);
    strokeWeight(10);
    rectMode(CORNER);
    noStroke();
    fill(0,map(fadeCount, 0,59,255,0));
    rect(0,0, width,height);
    fadeCount++;
    if(fadeCount == 60) {fade = false; gameend = false; }
    
  } else if(fade && gameend == false) {  // Fade to game screen
    rectMode(CORNER);
    noStroke();
    fill(0,map(fadeCount, 0,59,0,255));
    rect(0,0, width,height);
    
        
    introY1 = map(fadeCount, 0,59, 0,-height/2);
    introY2 = map(fadeCount, 0,59, 0,height/2);
    introX3 = map(fadeCount, 0,59, 18,0);
    introY3 = map(fadeCount, 0,59, 88,0);
    introS3 = map(fadeCount, 0,59, 0.6,1);
    
    // Smoke //
    if(smokeTimer > 5) {myObjects.add(0, new Smoke(myShip.location.x+introX3*scaleY, myShip.location.y+introY3*scaleY, myShip.direction.copy(), radians(random(-5,5)))); smokeTimer = 0;}
    int i = 0;
    while(i < myObjects.size()) {
      gameObject s = myObjects.get(i);
      if(s instanceof Smoke) {
        s.act();
        s.show();
      }
      i++;
      
    } 
    shipAnimation();
    smokeTimer++;
    fadeCount++;
    if(fadeCount == 60) {fadeCount = 0; gameend = false; mode = GAME;}
  }
  
  if(fade == false) shipAnimation();
  
  
  
}

void shipAnimation() {
    // Ship animation //
    pushMatrix();
      translate(width/2+introX3*scaleY, height/2+introY3*scaleY);
      rotate(radians(-90));
      scale(introS3*scaleY);
      
      fill(0);
      stroke(#6A7EFF);
      strokeJoin(ROUND);
      strokeWeight(4);
      triangle(35,0, -20,25, -20,-25);
    popMatrix();
  }
