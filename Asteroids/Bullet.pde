class Bullet extends gameObject {
  
  // Constructor //
  Bullet() {
    lives = 1;
    size = 5;
    location = new PVector(myShip.location.x,myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);  
    direction = new PVector(myShip.direction.x, myShip.direction.y);
  }
  
  
  // Act // 
  void act() {   
    super.act();
    
    if(location.x < 0 || location.x > width || location.y < 0 || location.y > height) lives = 0;
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
