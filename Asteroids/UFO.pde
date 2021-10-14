class UFO extends gameObject {
  
  // Instance Variables //
  int origin;  // which side of the screen does the UFO originate from
  int dir; // direction of travel 
  float velF;  // Forward velocity  -->
  float velA;  // Alternate velocity  ^
  float deathPos;  // Position to die at
  
  
  // Constructor //
  UFO() {
    lives = 1;
    size = 100;
    velF = random(5,10);
    velA = random(1,4);
    origin = int(random(0,4));  // Pick random side
    switch(origin) {  // Set location, velocity, and direction accordingly
      case 0:  // Top
        location = new PVector(random(0+size,width-size), -size/2);  // start at top
        if(location.x < width) dir = -1;  // set direction of travel
        if(location.x >= width) dir = 1;
        velocity = new PVector(velA*dir, velF);  // set velocity
        deathPos = height+size/2;  // Die at bottom
        break;
      case 1:  // Bottom
        location = new PVector(random(0+size,width-size), height+size/2);  // start at bottom
        if(location.x < width) dir = -1;  // set direction of travel
        if(location.x >= width) dir = 1;
        velocity = new PVector(velA*dir, -velF);  // set velocity
        deathPos = -size/2;  // Die at top
        break;
      case 2:  // Left
        location = new PVector(-size/2, random(0+size, height-size));  // start at left
        if(location.y < height) dir = -1;  // set direction of travel
        if(location.y >= height) dir = 1;
        velocity = new PVector(velF, velA*dir);  // set velocity
        deathPos = width+size/2;  // Die at right
        break;
     case 3:  // Right
        location = new PVector(-size/2, random(0+size, height-size));  // start at right
        if(location.y < height) dir = -1;  // set direction of travel
        if(location.y >= height) dir = 1;
        velocity = new PVector(-velF, velA*dir);  // set velocity
        deathPos = -size/2;  // Die at left
        break;
    }
  }
  
  
  // Act //
  void act() {
    super.act();
    
    
    // Die //
    switch(origin) {
       
    }
  }
  
  
  // Show //
  void show() {
    pushMatrix();
    translate(location.x, location.y);
      strokeWeight(5);
      stroke(255,0,255);
      noFill();
      circle(0,0, size);
    popMatrix();
  }
}
