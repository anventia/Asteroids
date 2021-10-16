


void game() {   
  
  background(0);
  
  // GameObjects //
  int i = 0;
  int lives = myShip.lives;
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
  
  if(score >= goal) {  // Game over, win
   gameend = true;
   fade = true;
   win = true;
   score = goal;
  }
  
  // Lives //
  i = 0;
  String text = "";
  switch(lives) {
    case 3: text = "A A A"; fill(#63F08A); break;
    case 2: text = "A A";   fill(#F0BF63); break;
    case 1: text = "A";     fill(#F06363); break;
    case 0:   // Game over, lose
      gameend = true;
      fade = true;
      win = false;
      break;
  }
  textAlign(LEFT);
  text(text, 10*scaleX, height-60*scaleY);
  
  
  // Teleport timer //
  fill(255);
  float timer = map(myShip.tpTimer, 0,3600, 60,0);
  if(int(timer) <= 0) {
    timer = 0;
    text("teleport ready [z]", 10*scaleX, height-20*scaleY);
  } else text("teleport in:"+int(timer)+" [z]", 10*scaleX, height-20*scaleY);
  
  
  // UFO //
  if(ufoTimer >= 600) {  // spawn a UFO every 10 seconds
    myObjects.add(new UFO());
    if(int(random(0,100)) == 99) myObjects.add(new UFO());  // Spawn a second UFO 1/100 of the time
    ufoTimer = 0;  // Reset the timer
    
  }
  println(ufoTimer);
  ufoTimer++;
  
  
  // Fade In // 
  if(fade == true && gameend == false) {  // Fade in from intro screen
  
  
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
    if(fadeCount == 60) {fadeCount = 0; fade = false;}
    
  } else if(fade == true && gameend == true) {  // Fade out to gameOver screen
    
  
    rectMode(CORNER);
    noStroke();
    fill(0,map(fadeCount, 0,59,0,255));
    rect(0,0, width,height);
    fadeCount++;
    if(fadeCount == 60) {fadeCount = 0; mode = GAMEOVER;}
  }
  
  
  
  
}
