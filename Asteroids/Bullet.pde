class Bullet extends gameObject {
  
  // Instance Variables //
  
  
  // Constructor //
  Bullet(String t) {  // Ship bullet
    type = t;
    lives = 100;
    size = 10;
    location = myShip.location.copy();
    velocity = myShip.direction.copy();
    velocity.setMag(10);  
    velocity.add(myShip.velocity);
    direction = myShip.direction.copy();
  }
  
  Bullet(String t, PVector l, PVector v, PVector d) {
    type = t;
    lives = 100;
    size = 10;
    location = l.copy();   
    velocity = d.copy();
    

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
      //rotate(direction.heading());
      fill(255);
      noStroke();
      //line(0,0, 10,0);
      circle(0,0, size);
    popMatrix();
  }
}
