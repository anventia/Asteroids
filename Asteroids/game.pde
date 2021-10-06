


void game() {   
  
  background(0);
    
  // Fade In // 
  if(fade) {
    rectMode(CORNER);
    fill(0,map(fadeCount, 0,59,255,0));
    noStroke();
    rect(0,0, width,height);
    fadeCount++;
    if(fadeCount == 60) {fade = false;}
  }
  
  
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
  
}
