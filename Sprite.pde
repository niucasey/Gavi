class Sprite {
  //class data
  float diameter, xPos, yPos;
  float dx, dy;
  float gravity;
  //constructor
  Sprite() {
    diameter = 30;
    xPos = width/2;
    yPos = 4*height/5;
    dx = 2;
    dy = 0.75;
    gravity = 0.01;
  }
  //class behavior

  void display() {
    ellipseMode(CENTER);
    fill(0);
    ellipse( xPos, yPos, diameter, diameter);
  }

  void moveRight() {
    if (xPos < width - diameter/2) {
      xPos += dx;
    } else {
      xPos = 0;
    }
  }

  void moveLeft() {
    if (xPos > 0 + diameter/2) {
      xPos -= dx;
    } else {
      xPos = width;
    }
  }

  void fall() {
    yPos += dy;
  }

  void hitPlatform(Platform _platform) {
    float distanceBetweenSpriteAndPlatform = dist(xPos, yPos, xPos, _platform.y);

    if (distanceBetweenSpriteAndPlatform <= diameter/2 && (xPos < _platform.x || xPos > _platform.x2)) {
      dy = -(_platform.speed);
    } else if (yPos >= height - diameter) {
      dy = -(_platform.speed);
    } else {
      dy+= gravity;
    }
  }
  
  boolean collectCoin( Coin _coin) {
    float distanceBetweenCoinAndGavi = dist(xPos, yPos, _coin.x, _coin.y);
    if (distanceBetweenCoinAndGavi <= diameter/2) {
      return true;
    }return false;
  }

  boolean isDead() {
    if (yPos + diameter/2 <= 0) {
      return true;
    }return false;
  }
}