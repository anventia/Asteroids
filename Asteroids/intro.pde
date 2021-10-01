


void intro() {
  background(0);
  textAlign(CENTER);
  textSize(100*scaleY);
  fill(255);
  text("AsTeRoidS", width/2,height/2);   
    
  fill(0);
  stroke(0);
  strokeWeight(2*scaleY);
  if(button(width/2,height/2+83*scaleY, 200*scaleY,75*scaleY, 2*scaleY, "stroke", 255, 0)){  // If button clicked, then fade, then go to game mode
    fade();
    mode = GAME;
  }
  
  fill(255);
  textSize(50*scaleY);
  text("pLAY", width/2,height/2+100*scaleY);
}
