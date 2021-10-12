class Bullet extends gameObject {
  
  // Constructor //
  Bullet() {
    lives = 100;
    size = 5;
    location = myShip.location.copy();
    velocity = myShip.direction.copy();
    velocity.setMag(10);  
    velocity.add(myShip.velocity);
    direction = myShip.direction.copy();
  }
  
  
  // Act // 
  void act() {   
    super.act();
    
    // Wraparound screen //
    if(location.x < size) location.x = width+size;
    if(location.x > width+size) location.x = -size;
    if(location.y < -size) location.y = height+size;
    if(location.y > height+size) location.y = -size;  
    
    
    lives --;
  }
  
  
  // Show //
  void show() {
    pushMatrix();
      translate(location.x,location.y);
      rotate(direction.heading());
      fill(255);
      noStroke();
      //line(0,0, 10,0);
      circle(0,0, 5);
    popMatrix();
  }
}
