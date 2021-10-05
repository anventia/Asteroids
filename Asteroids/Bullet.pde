class Bullet {
  
  // Instance Variables //
  int lives;
  
  PVector location;
  PVector velocity;
  PVector direction;
  
  
  // Constructor //
  Bullet() {
    lives = 1;
    location = new PVector(myShip.location.x,myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);  
    direction = new PVector(myShip.direction.x, myShip.direction.y);
  }
  
  
  // Act // 
  void act() {
    location.add(velocity);
    
    
  }
  
  
  // Show //
  void show() {
    pushMatrix();
      translate(location.x,location.y);
      rotate(direction.heading());
      stroke(255);
      strokeWeight(5);
      line(0,0, 10,0);
    popMatrix();
  }
}
