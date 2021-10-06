class Smoke extends gameObject {
  
  // Instance Variables //
  float spin;
 
  // Constructor //
  Smoke() {
    lives = 5;
    spin = 0;
    
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(-2);
    direction = new PVector(int(random(0,2)), 0);
  }
  
  
  // Act //
  void act() {
    super.act();
    lives --;
    velocity.rotate(radians(random(-45,45)));
    if(direction.x == 0) spin += radians(1);
    if(direction.x == 1) spin -= radians(-1);
  }
  
  
  // Show //
  void show() {
    pushMatrix();
      translate(location.x, location.y);
      rotate(spin);
      noFill();
      stroke(255, 100);
      strokeWeight(1);
      rectMode(CENTER);
      rect(0,0, 10,10);
    popMatrix();
  }
  
  
}
