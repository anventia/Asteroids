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
    if(location.x < -size/2) location.x = width+size/2;
    if(location.x > width+size/2) location.x = -size/2;
    if(location.y < -size/2) location.y = height+size/2;
    if(location.y > height+size/2) location.y = -size/2;
    
    // Spin //
    if(spinDirection == 0) direction.rotate(radians(spinSpeed));  // Clockwise
    if(spinDirection == 1) direction.rotate(radians(spinSpeed*-1));  // Counterclockwise
    
    // Detect collisions //
    int i = 0;
    while(i < myObjects.size()) {
      gameObject obj = myObjects.get(i);
      if(obj instanceof Bullet && dist(obj.location.x,obj.location.y, location.x,location.y) < size/2+obj.size/2) {  // Bullet Collisions
        switch(size) {
          case bigAsteroid: 
            explode(location.x, location.y);
            myObjects.add(new Asteroid(medAsteroid, location.x, location.y));  // Add two medium asteroids
            myObjects.add(new Asteroid(medAsteroid, location.x, location.y));
            break;
          case medAsteroid:
            explode(location.x, location.y);
            myObjects.add(new Asteroid(smlAsteroid, location.x, location.y));  // Add two small asteroids
            myObjects.add(new Asteroid(smlAsteroid, location.x, location.y));
            break;
          case smlAsteroid:
            explode(location.x, location.y);
            myObjects.add(new Asteroid(tnyAsteroid, location.x, location.y));  // Add two tiny asteroids
            myObjects.add(new Asteroid(tnyAsteroid, location.x, location.y));
            break;
          case tnyAsteroid:
            explode(location.x, location.y);
            break;  // Don't add any more
        }
        obj.lives = lives = 0; // Kills asteroid and bullet
        
      } else if(obj instanceof Asteroid && dist(obj.location.x,obj.location.y, location.x,location.y) < size/2+obj.size/2 && dist(obj.location.x,obj.location.y, location.x,location.y) != 0) {  // Other asteroid collisions
        float x2 = obj.location.x;  // Location of other asteroid
        float y2 = obj.location.y;
        
        float dx = location.x-x2;  // Distance between asteroids
        float dy = location.y-y2;

        velocity.x = 1* dx/sqrt((dx*dx)+(dy*dy));
        velocity.y = 1* dy/sqrt((dx*dx)+(dy*dy));
       
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
  
  
  // Explode //
  void explode(float x, float y) {
    score++;
    int i = 0;
    int smokeTimer = 0;
    while(i < 35) {
      if(smokeTimer > 1) {myObjects.add(new Smoke(x,y, new PVector(0,random(0.5,5)), radians(random(0,360)))); smokeTimer = 0;}
      i++;
      smokeTimer++;  // Timer can be increased
    }
  }
}
