class PowerUp {
  // Member variables
  int x, y, w, speed;
  char type;
  PImage p1, p2, p3;
  color c1;
  // Constructor
  PowerUp() {
    x = int(random(width));
    y = -100;
    w = int(random(50, 100));
    speed = 4;
    c1 = color(200);
    if (random(10)>6.6) {
      //p1 = loadImage("rock1.png");
      type = 'a'; //<----this is ammo
      c1 = color(200);
    } else if (random(10)>5.0) {
      //p1 = loadImage("rock2.png");
      type = 'h';
      c1 = color(200);
    } else {
      type = 's';
      //p1 = loadImage("rock3.png");
    }
  }



  // Member Methods
  void display() {
    fill(c1);
    ellipse(x, y, w, w);
    fill(255);

    text(type, x, y);
    //imageMode(CENTER);
    //r1.resize(diam, diam);
    //image(r1, x, y);
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

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
