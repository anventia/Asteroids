


void game() {   
  
  background(0);
  
  // test //
  //textAlign(CENTER);
  //textSize(50*scaleY);
  //fill(255);
  //text("<test>", width/2,height/2); 
  
  
  // Ship //
  myShip.show();
  myShip.act();
  
  
  // Bullets //
  int i = 0;
  while(i < myBullets.size()) {  // Bullets
    Bullet b = myBullets.get(i);
    float x = b.location.x;
    float y = b.location.y;
    b.show();
    b.act();
    
    if(x < 0 || x > width || y < 0 || y > height) myBullets.remove(i);
    
    i++;
  }
  
  if(space) myBullets.add(new Bullet());
    
  // Fade In // 
  if(fade) {
    rectMode(CORNER);
    fill(0,map(fadeCount, 0,59,255,0));
    noStroke();
    rect(0,0, width,height);
    fadeCount++;
    if(fadeCount == 60) {fade = false;}
  }
}
