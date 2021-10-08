class Smoke extends gameObject {
  
  // Instance Variables //
  float spin;
  color clr;
  
  // Constructor //
  Smoke(float x, float y, PVector v, float dir) {
    lives = 50;
    spin = 0;
    clr = smokeColors[int(random(0,smokeColors.length))];
    
    spinDirection = int(random(0,2));
    spinSpeed = random(1, 3);
    
    location = new PVector(x,y);
    velocity = v;
    if(velocity.x == myShip.direction.copy().x && velocity.y == myShip.direction.copy().y) {  // Only for ship smoke, not explosion smoke
      velocity.setMag(0.3);
      velocity.add(myShip.velocity);
    }
    velocity.rotate(dir);  // Random direction backwards from ship
    direction = myShip.direction.copy();
    
  }
  
  
  // Act //
  void act() {
    super.act();
    lives --;
    
    // Spin //
    if(spinDirection == 0) direction.rotate(radians(spinSpeed));  // Clockwise
    if(spinDirection == 1) direction.rotate(radians(spinSpeed*-1));  // Counterclockwise
    
  }
  
  
  // Show //
  void show() {
    pushMatrix();
      translate(location.x, location.y);
      stroke(255);
      //line(-width,0, width,0);  // Debug line to make smoke more visible
      rotate(direction.heading()+radians(180));
      noFill();
      
      stroke(clr, map(lives, 50,0, 255,0));
      
      strokeWeight(3);
      rectMode(CENTER);
      //rect(0,0, 10,10);
      int n = int(map(lives, 50,15, 12,3));
      if(n < 3) n = 3;
      polygon(0,0, 10, n);
    popMatrix();
  }
  
  
}
