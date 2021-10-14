void gameOver() {
  
  background(0);
  
  String text = "";  // Changes text based on win or loss
  if(win) text = "you win!";
  else    text = "you lose!";
  
  textSize(100);
  textAlign(CENTER);
  fill(255);
  text(text, width/2,height/2);  // Title text
  
  fill(0);
  stroke(0);
  strokeWeight(2*scaleY);
  if(button(width/2,height/2+83*scaleY, 500*scaleY,75*scaleY, 2*scaleY, "stroke", 255, 0) && fade == false) {fade = true; fadeCount = 0;} else {mouseClick = false;}  // If button clicked, fade, then go to intro mode

  fill(255);
  textSize(50*scaleY);
  text("- continue -", width/2,height/2+100*scaleY);  // button text
  
  // Fade // 
  if(fade == true && gameend == true) {  // Fade from game screen
    rectMode(CORNER);
    fill(0,map(fadeCount, 0,59,255,0));
    noStroke();
    rect(0,0, width,height);
    
    fadeCount++;
    if(fadeCount == 60) {fade = false; gameend = false;}
     
  } else if(fade == true && gameend == false) {  // Fade to intro screen
    rectMode(CORNER);
    noStroke();
    fill(0,map(fadeCount, 0,59,0,255));
    rect(0,0, width,height);
    fadeCount++;
    if(fadeCount == 60) {fadeCount = 0; gameend = true; initGame(); mode = INTRO;}
  }
  
  
}