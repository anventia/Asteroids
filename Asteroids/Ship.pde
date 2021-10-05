class Ship {
  
  // Instance Variables //
  int lives;
  
  PVector location;  // Location
  PVector velocity;  // Velocity
  PVector direction;  // Direction
  
  
  // Constructor //
  Ship() {
    lives = 3;
    
    location = new PVector(width/2,height/2);  // x,y
    velocity = new PVector(0,0);  // xV, yV
    direction = new PVector(0,-0.1);  // deg, speed
    
  }
  
  
  // Act //
  void act() {
    location.add(velocity);  // Change locaiton
    
    // Keyboard input //
    if(up) velocity.add(direction);
    if(down) velocity.sub(direction);
    if(left) direction.rotate(-radians(4));
    if(right) direction.rotate(radians(4));
    
    // Wraparound screen //
    if(location.x < -55) location.x = width+55;
    if(location.x > width+55) location.x = -55;
    if(location.y < -55) location.y = height+55;
    if(location.y > height+55) location.y = -55;
    

    velocity.mult(0.992);
  }
  
  
  // Show //
  void show() {
    pushMatrix();  // Draw the ship
      translate(location.x, location.y);
      rotate(direction.heading());
      noFill();
      stroke(255);
      strokeWeight(5);
      strokeJoin(ROUND);
      
      triangle(35,0, -20,25, -20,-25);
    popMatrix();
  }
}
