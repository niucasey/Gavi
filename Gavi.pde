//Casey Niu
// Arrays of Objects
//November 29, 2016

//Extra for Experts
//2 ArrayLists
//add and remove elements from the ArrayLists
//collision detection 
//Inheritence

ArrayList<Platform> platforms;
Sprite gavi;
ArrayList<Coin> coins;
int state, score;
PFont writing, titleWriting;
PImage deadGavi, aliveGavi;

void setup() {
  size(600, 600);
  state = 0;
  score = 0;
  deadGavi = loadImage("deadGavi.PNG");
  aliveGavi = loadImage("aliveGavi.JPG");
  gavi = new Sprite();
  
  platforms = new ArrayList<Platform>();
  for (int i = 0; i < 8; i++) {//8 is the number of platforms that fit on the screen at once
    platforms.add(new Platform(random(gavi.diameter*2, width - gavi.diameter*2), 75 * i));
  }
  coins = new ArrayList<Coin>();
  for (int i = 0; i < 8; i ++){
    coins.add( new Coin(random(gavi.diameter*2, width - gavi.diameter*2), 75 * i - 15)); //size of the coins (diameter) divided by two
  }
  
  writing = createFont("Elepahnt Italic", 35);
  titleWriting = createFont("Elepant Italic", 50);
  
}

void draw() {
  if (state == 0) {
    startScreen();
  }else if (state == 1) {
    gameScreen();
  }else if (state == 2) {
    gameOver();
  }
}

void startScreen() {
  background(#9DBEF2);
  textFont(writing);
  textAlign(CENTER, CENTER);
  text("Press the spacebar to play!", width/2, height/3);
  textFont(titleWriting);
  text("Gavi Falls... and Dies", width/2, height/5);
  imageMode(CENTER);
  image(aliveGavi, width/2, height/1.5, 200, 200);
  if (keyPressed) {
    if (key == ' ') { //spacebar to play
      state ++;
    }
  }
}

void gameScreen() {
  background(#9DBEF2);
  textFont(writing);
  text("Score:" + score, 2*width/3, 20);
  
  for (Platform thisPlatform : platforms) { // for(int i = 0; i <platforms.size(); i++)
    thisPlatform.move();
    thisPlatform.display();
    gavi.hitPlatform(thisPlatform);
  }
  
  for(Coin thisCoin : coins) {// for (int i = 0; i < coins.size9); i++)
    thisCoin.move();
    thisCoin.display();
    thisCoin.reset();
  }
  
  for(int i = platforms.size()-1; i>=0; i--) {
    Platform thisPlatform = platforms.get(i);
    if (thisPlatform.isDone()){
      platforms.remove(i);
      platforms.add(new Platform(random(gavi.diameter*2, width - gavi.diameter*2), height - 20));
      coins.add(new Coin (random(gavi.diameter*2, width - gavi.diameter*2), 35));
    }
  }
  
  for (int i = coins.size()-1; i >=0; i--) {
    Coin thisCoin = coins.get(i);
    if (gavi.collectCoin(thisCoin)) {
      score+=100;//increase the score if collected coins
      coins.remove(i);
    }
  }
  
  if (keyPressed) {
    if (keyCode == RIGHT) {
      gavi.moveRight();
    }else if (keyCode == LEFT) {
      gavi.moveLeft();
    }
  }
  
  gavi.fall();
  gavi.display();
  
  if (gavi.dy >0) {//if gavi is falling down, increase the score
    score++;
  }
  if (gavi.isDead()) {
    state ++;
  }
}

void gameOver() {
  background(0);
  fill(255);
  text("Oh no, you killed Gavi!", width/2, height/5);
  text("Score:" + score, width/2, height/5 + 40);
  text("Press the spacebar to play again!", width/2, 4*height/5);
  imageMode(CENTER);
  image(deadGavi, width/2, height/2, 200, 200);
  if (keyPressed) {
    if (key == ' '){
      state = 1;
      gavi.yPos = 4*height/5;
      score = 0;
    }
  }
}