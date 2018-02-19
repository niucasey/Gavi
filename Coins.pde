class Coin extends Items{
  int size;
  //constructor
  Coin(float _x, float _y) {
    super(_x, _y);
    size = 15;
  }
  //behavior
  void display(){
    ellipseMode(CENTER);
    fill(#EAD84C);
    ellipse(x, y, size, size);
  }
  
  
  void reset() {
    if (y <= 0 ) {
      y = height;
      x = random(gavi.diameter*2, width - gavi.diameter*2);
    }
  }
}