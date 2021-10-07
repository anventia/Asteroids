void polygon(float x,float y, float r, int n) {
  beginShape(); for(float i = 0, a=TWO_PI/n; i <= n; i++) {vertex(x+r*cos(a*i), y+r*sin(a*i));} endShape();
}



/* PVector version that is a few characters shorter...

void polygon(PVector d, float r,int n){beginShape();for(float i=0,a=TAU/n;i<=n;i++){vertex(d.x+r*cos(a*i),d.y+r*sin(a*i));}endShape();}

*/
