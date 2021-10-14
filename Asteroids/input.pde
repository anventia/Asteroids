
// Mouse //
boolean mouseClick = false;

void mouseClicked() {
  mouseClick = true;  // Mouse detection for buttons
}


// Keyboard //
boolean up, down, left, right, space, zkey, akey;

void keyPressed() {
  if(keyCode == UP)            up    = true;
  if(keyCode == DOWN)          down  = true;
  if(keyCode == LEFT)          left  = true;
  if(keyCode == RIGHT)         right = true;
  if(key == ' ')               space = true;
  if(key == 'Z' || key == 'z') zkey  = true;
  if(key == 'A' || key == 'A') akey  = true;
}

void keyReleased() {
  if(keyCode == UP)            up    = false;
  if(keyCode == DOWN)          down  = false;
  if(keyCode == LEFT)          left  = false;
  if(keyCode == RIGHT)         right = false;
  if(key == ' ')               space = false;
  if(key == 'Z' || key == 'z') zkey  = false;
  if(key == 'A' || key == 'a') akey  = true;
}
