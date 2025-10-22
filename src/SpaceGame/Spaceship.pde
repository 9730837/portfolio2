class Spaceship {
  // Member variables
  int x, y, w, turretCount, laserCount, health, ammo;
  PImage rocketspace;

  // Constructor
  Spaceship() {
    ammo = 100;
    x = width/2;
    y = height/2;
    w = 100;
    health = 100;
    turretCount = 1;
    laserCount = 1;
    rocketspace = loadImage("rocket.png");
  }
  // Member Methods
  void display() {
    rocketspace.resize(100, 100);
    image(rocketspace, x, y);
    imageMode(CENTER);
    image(rocketspace, mouseX, mouseY);
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void fire() {
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
