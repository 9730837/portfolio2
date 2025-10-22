class Rock {
  // Member variables
  int x, y, diam, speed;
  PImage r1;

  // Constructor
  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(50, 100));
    speed = int(random(2, 5));
    if (random(10)>6.6) {
      r1 = loadImage("smileyfaceRock-1.png.png");
    } else if (random(10)>5.0) {
      r1 = loadImage("MoonRock-1.png.png");
    } else {
      r1 = loadImage("FireBallRock-1.png.png");
    }
  }
  // Member Methods
  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
  }

  void move() {
    y = y + speed;
  }


  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
    return false;
    }
  }
}
