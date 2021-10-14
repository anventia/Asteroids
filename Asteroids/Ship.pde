class Ship extends gameObject {
  
  // Instance Variables //
  int gunTimer;
  int smokeTimer;
  int tpTimer = 3600;
  PVector shield;
  
  // Constructor //
  Ship() {
    lives = 3;
    gunTimer = 0;
    smokeTimer = 0;
    spinDirection = 0;
    spinSpeed = 1;
    
    location = new PVector(width/2,height/2);  // x,y
    velocity = new PVector(0,0);  // xV, yV
    direction = new PVector(0,-0.1);  // deg, speed
    shield = new PVector(0,-0.1);
  }
  
  
  // Act //
  void act() {
    super.act();   
    // Motion //
    if(up) {velocity.add(direction); if(smokeTimer > 5) {myObjects.add(0, new Smoke(myShip.location.x, myShip.location.y, myShip.direction.copy(), radians(random(-7,7)))); smokeTimer = 0;}}
    if(down) velocity.sub(direction);
    if(left) direction.rotate(-radians(4));
    if(right) direction.rotate(radians(4));
    
    
    // Bullet //
    if(space && gunTimer > 20) {myObjects.add(0, new Bullet()); gunTimer = 0;}  // Adds bullets to BEGINNING of arrayList, so they get drawn under the ship.
    
    
    // Teleport to safe spot //
    if(zkey && tpTimer >= 3600) {
      //zkey = false;
      float cx = 0;  // closest asteroid coordinates
      float cy = 0;
      float s = 0;  // asteroid size
      float sx = location.x;  // ship coordinates
      float sy = location.y;
      boolean scan = true;
      
      stroke(255,100,255);
      noFill();
      strokeWeight(7);
      while(scan) {
        sx = random(30,width-30);
        sy = random(30,height-30);
        int i = 0;
        while(i < myObjects.size()) {  // Loop through all asteroids and find out the closest one
          gameObject obj = myObjects.get(i);
          if(obj instanceof Asteroid) {
            if(dist(sx,sy, obj.location.x,obj.location.y)-obj.size/2 < dist(sx,sy, cx,cy)-s/2) {  // Is the distance to this asteroid closer than the previous one?
              cx = obj.location.x;
              cy = obj.location.y;
              s = obj.size;
            }
          }
          i++;
        }
        if(dist(sx,sy, cx,cy) > s+60) {  // Is closest asteroid far enough away
          //circle(cx,cy, s*1.5);  // Debug
          //line(sx,sy, cx,cy);  
          invTimer = 0;  // Give invincibility
          location.x = sx;
          location.y = sy;
          tpTimer = 0;
          hit = true;
          scan = false;
        }
      }
    }
    
    
    // Wraparound screen //
    if(location.x < -55) location.x = width+55;
    if(location.x > width+55) location.x = -55;
    if(location.y < -55) location.y = height+55;
    if(location.y > height+55) location.y = -55;
    
    
    // Spin shield //
    if(hit == true) {spinDirection = int(random(0,2)); spinSpeed = random(0.2, 0.7); hit = false;}
    if(spinDirection == 0) shield.rotate(radians(spinSpeed));  // Clockwise
    if(spinDirection == 1) shield.rotate(radians(spinSpeed*-1));  // Counterclockwise

    // //
    velocity.mult(0.997);
    gunTimer ++;
    smokeTimer ++;
    invTimer ++;
    tpTimer++;
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
    pushMatrix();
      translate(location.x, location.y);
      if(invTimer < 300) {  // invincibility indicator circle
        stroke(200);
        strokeWeight(2);
        //circle(0,0, 100);
        pushMatrix();
          rotate(shield.heading());
          fill(#4FEFFC, 30);
          polygon(0,0, 60, 6);
          noFill();
          polygon(0,0, 60, 3);
        popMatrix();
      }
    popMatrix();
  }
  
}


void closestAsteroid() {
 
}
