void gif() {
  imageMode(CENTER);
  image(gif[loadFrame], width/2,height/2, width, height);  // gif
  loadFrame++;
  if(loadFrame == frames) loadFrame = 0; 
}
