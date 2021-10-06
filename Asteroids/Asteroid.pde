class Asteroid extends gameObject {
   
  // Instance Variables //
  int poly;  // number of sides on polygon
  
  
  // Constructor //
  Asteroid(int sz, float locX, float locY) {
    lives = 1;
    size = sz;
    switch(size) {  // Sets number of sides
      case bigAsteroid: poly = 6; break;
      case medAsteroid: poly = 5; break;
      case smlAsteroid: poly = 4; break;
      case tnyAsteroid: poly = 3; break;
    }
    spinDirection = int(random(0,2));
    spinSpeed = random(0.2, 0.7);
    
    location = new PVector(locX, locY);
    velocity = new PVector(0,1);
    velocity.rotate(radians(random(0,360)));
    direction = new PVector(0,-0.1);
  }
  
  
  // Act //
  void act() {
    super.act();
    
    // Wraparound screen //
    if(location.x < -bigAsteroid/2) location.x = width+bigAsteroid/2;
    if(location.x > width+bigAsteroid/2) location.x = -bigAsteroid/2;
    if(location.y < -bigAsteroid/2) location.y = height+bigAsteroid/2;
    if(location.y > height+bigAsteroid/2) location.y = -bigAsteroid/2;
    
    // Spin //
    if(spinDirection == 0) direction.rotate(radians(spinSpeed));  // Clockwise
    if(spinDirection == 1) direction.rotate(radians(spinSpeed*-1));  // Counterclockwise
    
    // Detect collisions //
    int i = 0;
    while(i < myObjects.size()) {
      gameObject obj = myObjects.get(i);
      if(obj instanceof Bullet) {  // Is object Bullet?
        if(dist(obj.location.x,obj.location.y, location.x,location.y) < size/2+obj.size/2) {  // Is bullet touching asteroid?
          switch(size) {
            case bigAsteroid: 
              myObjects.add(new Asteroid(medAsteroid, location.x, location.y));  // Add two medium asteroids
              myObjects.add(new Asteroid(medAsteroid, location.x, location.y));
              break;
            case medAsteroid:
              myObjects.add(new Asteroid(smlAsteroid, location.x, location.y));  // Add two small asteroids
              myObjects.add(new Asteroid(smlAsteroid, location.x, location.y));
              break;
            case smlAsteroid:
              myObjects.add(new Asteroid(tnyAsteroid, location.x, location.y));  // Add two tiny asteroids
              myObjects.add(new Asteroid(tnyAsteroid, location.x, location.y));
              break;
            case tnyAsteroid:
              break;  // Don't add any more
          }
          obj.lives = lives = 0; // Kills asteroid and bullet
        }
      }
      i++;
    }
  }
  
  
  // Show //
  void show() {
    pushMatrix();
      translate(location.x, location.y);
      rotate(direction.heading());
      noFill();
      stroke(255);
      strokeWeight(2);
      circle(0,0, size);
      polygon(0,0, size/2-4, poly);
    popMatrix();
  }
}
