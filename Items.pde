class Items {
  float x, y, speed;
  Items(float _x, float _y){
    x = _x;
    y = _y;
    speed = 1;
  }
  
  void move() {
    y -= speed;
  }
}