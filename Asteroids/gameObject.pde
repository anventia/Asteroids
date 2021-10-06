class gameObject {
  
  // Instance Variables //
  int lives;
  int size;
  
  PVector location;  // Location
  PVector velocity;  // Velocity
  PVector direction;  // Direction
  
  
  // Constructor //
  gameObject() {
    
  }
  
  
  // Act //
  void act() {
    location.add(velocity);  // Change location
  }
  
  
  // Show //
  void show() {
    
  }
}
