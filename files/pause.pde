void pause() {
  background(0);
  
  // render game objects //
  int i = 0;
  while(i < myObjects.size()) {
    gameObject obj = myObjects.get(i);
    obj.show();
    i++;
  }

  gif();
  
  fill(255);
  textSize(50*scaleY);
  textAlign(CENTER);
  text("press ESC to resume", width/2,height/2);  // text
  
  if(esc) {  // resume
    esc = false;
    mode = GAME;
  }
  
}
