class Ship extends gameObject {
  
  // Instance Variables //
  int gunTimer;
  int smokeTimer;
  
  
  // Constructor //
  Ship() {
    lives = 3;
    gunTimer = 0;
    smokeTimer = 0;
    
    location = new PVector(width/2,height/2);  // x,y
    velocity = new PVector(0,0);  // xV, yV
    direction = new PVector(0,-0.1);  // deg, speed
    
  }
  
  
  // Act //
  void act() {
    super.act();   
    // Keyboard input //
    if(up) {velocity.add(direction); if(smokeTimer > 5) {myObjects.add(0, new Smoke(myShip.location.x, myShip.location.y, myShip.direction.copy(), radians(random(-7,7
  )))); smokeTimer = 0;}}
    if(down) velocity.sub(direction);
    if(left) direction.rotate(-radians(4));
    if(right) direction.rotate(radians(4));
    
    if(space && gunTimer > 20) {myObjects.add(0, new Bullet()); gunTimer = 0;}  // Adds bullets to BEGINNING of arrayList, so they get drawn under the ship.
    
    // Wraparound screen //
    if(location.x < -55) location.x = width+55;
    if(location.x > width+55) location.x = -55;
    if(location.y < -55) location.y = height+55;
    if(location.y > height+55) location.y = -55;

    velocity.mult(0.997);
    gunTimer ++;
    smokeTimer ++;

  }
  
  
  // Show //
  void show() {
    pushMatrix();  // Draw the ship
      translate(location.x, location.y);
      rotate(direction.heading());
      fill(0);
      stroke(#6A7EFF);
      strokeWeight(4);
      strokeJoin(ROUND);
      
      triangle(35,0, -20,25, -20,-25);
    popMatrix();
  }
  
}
