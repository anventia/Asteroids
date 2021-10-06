class Smoke extends gameObject {
  
  // Instance Variables //
  float spin;
  
  // Constructor //
  Smoke() {
    lives = 50;
    spin = 0;
    
    
    spinDirection = int(random(0,2));
    spinSpeed = random(1, 3);
    
    location = myShip.location.copy();
    velocity = myShip.direction.copy();
    velocity.setMag(-0.1);
    velocity.add(myShip.velocity);
    velocity.rotate(radians(random(-5,5)));  // Random direction backwards from ship

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
      rotate(direction.heading()+radians(180));
      noFill();
      stroke(255, map(lives, 50,0, 255,100));
      strokeWeight(1);
      rectMode(CENTER);
      //rect(0,0, 10,10);
      polygon(0,0, 10, int(map(lives, 50,0, 12,3)));
    popMatrix();
  }
  
  
}
