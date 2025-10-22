class Laser {
  // Member variables
  int x, y, w, h, speed;
  PImage l1;
  
  // Constructor
  Laser(int x, int y) {
    l1 = loadImage("laser.png");
    this.x = x;
    this.y = y;
    y = -100;
    w = 4;
    h = 10;
    speed = 10;
    //Pimage goes here
  }
  // Member Methods
  void display() {
    image(l1, x, y);
  }

  void move() {
    y = y - speed;
  }


  boolean reachedTop() {
    if (y<0-20) {
      return true;
    } else {
      return false;
    }
  } 
  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(PowerUp r) {
    float d = dist(x, y, r.x, r.y);
    if (d<10) {
      return true;
    } else {
      return false;
    }
  }
}
