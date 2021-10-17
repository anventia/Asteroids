class gameObject {
  
  // Instance Variables //
  int lives;
  int size;
  int spinDirection;
  float spinSpeed;
  
  PVector location;  // Location
  PVector velocity;  // Velocity
  PVector direction;  // Direction
  
  String type; // Only for bullet
  
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
