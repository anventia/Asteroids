


void game() {   
  
  background(0);
  
  // GameObjects //
  int i = 0;
  while(i < myObjects.size()) {
    gameObject obj = myObjects.get(i);
    int l = obj.lives;
    obj.show();
    obj.act();
    
    if(l == 0) myObjects.remove(i);  // die
    else i++;
  }
  
  
  // Score //
  fill(255);
  textAlign(RIGHT);
  textSize(35*scaleY);
  text(score+" / "+goal, width-10*scaleX, height-20*scaleY);
  
  if(score >= goal) {  // Game over, will add fade effect later
   if(fade == false) fadeCount = 0;  // Resets only the first time
   fade = true;
   win = true;
   score = goal;
  }
  
  // Lives //
  i = 0;
  String text = "";
  switch(lives) {
    case 3: text = "A A A"; break;
    case 2: text = "A A";  break;
    case 1: text = "A";   break;
    case 0: break;
  }
  fill(255);
  textAlign(LEFT);
  text(text, 10*scaleX, height-20*scaleY);
  
  
  // Fade In // 
  if(fade == true && score != goal) {  // Fade in from intro screen
    rectMode(CORNER);
    fill(0,map(fadeCount, 0,59,255,0));
    noStroke();
    rect(0,0, width,height);
    int j = 0;
    while(j < myObjects.size()) {  // Draw ship over fade in rectangle, so it doesn't fade in
      gameObject obj = myObjects.get(j);
      if(obj instanceof Ship) {
        obj.show();
      }
      j++;
    }
    fadeCount++;
    if(fadeCount == 60) {fade = false;}
    
  } else if(fade == true && score >= goal) {  // Fade out to gameOver screen
    rectMode(CORNER);
    noStroke();
    fill(0,map(fadeCount, 0,59,0,255));
    rect(0,0, width,height);
    fadeCount++;
    if(fadeCount == 60) {fadeCount = 0; mode = GAMEOVER;}
  }
  
  
  
  
}
