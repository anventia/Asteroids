class Asteroid extends gameObject {
  
  // Constructor //
  Asteroid() {
    lives = 1;
    location = new PVector(random(0-bigAsteroid/2, width+bigAsteroid/2), random(0-bigAsteroid/2, height+bigAsteroid/2));
    velocity = new PVector(0,1);
    velocity.rotate(radians(random(0,360)));
  }
  
  
  // Act //
  void act() {
    super.act();
    
    // Wraparound screen //
    if(location.x < -bigAsteroid/2) location.x = width+bigAsteroid/2;
    if(location.x > width+bigAsteroid/2) location.x = -bigAsteroid/2;
    if(location.y < -bigAsteroid/2) location.y = height+bigAsteroid/2;
    if(location.y > height+bigAsteroid/2) location.y = -bigAsteroid/2;
    
    int i = 0;
    while(i < myObjects.size()) {
      gameObject obj = myObjects.get(i);
      if(obj instanceof Bullet) {  // Is object Bullet?
        if(dist(obj.location.x,obj.location.y, location.x,location.y) < bigAsteroid/2+obj.size/2) {  // Is bullet touching asteroid?
          obj.lives = lives = 0; // Remove asteroid and bullet
        }
      }
      i++;
    }
  }
  
  
  // Show //
  void show() {
    pushMatrix();
      translate(location.x, location.y);
      noFill();
      stroke(255);
      strokeWeight(4);
      circle(0,0, bigAsteroid);
    popMatrix();
  }
}
