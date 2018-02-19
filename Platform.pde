class Platform extends Items{
  //class data
  float x2, rectHeight, spaceBetweenPlatforms;
  //constructor
  Platform(float _x, float _y) {
    super(_x, _y);
    spaceBetweenPlatforms = 100;
    x2 = _x + spaceBetweenPlatforms;
    rectHeight = 20;
    
  }
  //class behavior
  void display() {
    rectMode(CORNER);
    fill(#BAF29D);
    rect(0, y, x, rectHeight, 25);
    rect(x2, y, width, rectHeight, 25);
  }
  
  boolean isDone() {
    if (y + rectHeight <= 0) {
      return true;
    }return false;
  }
  
}