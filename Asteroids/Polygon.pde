void polygon(float x,float y, float r, int sides) {
  float angle = radians(360/sides);
  beginShape();
    int i = 0;
    while(i < sides+1) {
      vertex(x+r*cos(angle*i), y+r*sin(angle*i));
      i++;
    }
  endShape();
}
