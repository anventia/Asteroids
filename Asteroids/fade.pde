


void fade() {
 int fade = 0;
 colorMode(RGB);
 fill(255,255,255,100);
 noStroke();
 rectMode(CORNER);
 rect(0,0, width,height); 
 while(fade < 6000) {
   rect(0,0, width,height); 
   println(fade);
   fade++;
 }
 println("end");
}
