class UFO extends gameObject {
  
  // Instance Variables //
  int origin;  // which side of the screen does the UFO originate from
  int dir; // direction of travel 
  float velF;  // Forward velocity in direction of travel  -->
  float velA;  // Alternate velocity  ^
  float deathPos;  // Position to die at
  int gunTimer;
  
  
  // Constructor //
  UFO() {
    lives = 1;
    gunTimer = 50;
    size = 50;
    velF = random(2,5);
    velA = random(2,5);
    origin = int(random(0,4));  // Pick random side
    switch(origin) {  // Set location, velocity, and direction accordingly
      case 0:  // Top
        location = new PVector(random(0+size,width-size), -size/2+1);  // start at top
        if(location.x < width) dir = -1;  // set direction of travel
        if(location.x >= width) dir = 1;
        velocity = new PVector(velA*dir, velF);  // set velocity
        break;
      case 1:  // Bottom
        location = new PVector(random(0+size,width-size), height+size/2-1);  // start at bottom
        if(location.x < width) dir = -1;  // set direction of travel
        if(location.x >= width) dir = 1;
        velocity = new PVector(velA*dir, -velF);  // set velocity
        break;
      case 2:  // Left
        location = new PVector(-size/2+1, random(0+size, height-size));  // start at left
        if(location.y < height) dir = -1;  // set direction of travel
        if(location.y >= height) dir = 1;
        velocity = new PVector(velF, velA*dir);  // set velocity
        break;
     case 3:  // Right
        location = new PVector(-size/2-1, random(0+size, height-size));  // start at right
        if(location.y < height) dir = -1;  // set direction of travel
        if(location.y >= height) dir = 1;
        velocity = new PVector(-velF, velA*dir);  // set velocity
        break;
    }
  }
  
  
  // Act //
  void act() {
    super.act();
      
    
    // Shoot //
    if(gunTimer > 50) {
      gunTimer = 0;
      PVector shootDir = new PVector();
      float dx = location.x - myShip.location.x;
      float dy = location.y - myShip.location.y;
      
      shootDir.x = -5*dx/sqrt((dx*dx)+(dy*dy));
      shootDir.y = -5*dy/sqrt((dx*dx)+(dy*dy));
            
      myObjects.add(new Bullet("ufo", location, velocity, shootDir));  // Add UFO bullet
    }
    
    
    // Die from bullets //
    int i = 0;
    while(i < myObjects.size()) {
      gameObject obj = myObjects.get(i);
      if(obj instanceof Bullet && obj.type.equals("ship") && dist(location.x,location.y, obj.location.x,obj.location.y) < size/2+obj.size/2) {  // Only collide with Ship Bullets
        lives = 0;
      }
      i++;
    }
    
    
    // Die off screen //
    if(location.x < -size/2 || location.x > width+size/2 || location.y < -size/2 || location.y > height+size/2) {  // Check if outside screen
      lives = 0;
    }
    gunTimer++;
  }
  
  
  // Show //
  void show() {
    pushMatrix();
    translate(location.x, location.y);
      strokeWeight(5);
      stroke(255,0,255);
      noFill();
      circle(0,0, size);
      polygon(0,0, size/2, 2);
    popMatrix();
  }
}
