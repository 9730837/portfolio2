class Star {
  int x, y, w, speed;

  Star() {
    x = int(random(width));
    y = -10;
    w = int(random(1, 4));
    speed = int(random(1, 10));
  }

  void display() {
    fill(random(225, 255));
    ellipse(x, y, w, w);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+10) {
      return true;
    } else {
      return false;
    }
  }
}












//  float x, y;      // Position
//  float size;      // Size of the star
//  float brightness; // Brightness (alpha)
//  float twinkleSpeed; // Twinkle speed

//  Star() {
//      for (int i = 0; i < numStars; i++) {
//    stars[i] = new Star();  // Create stars
//    x = random(width);
//    y = random(height);
//    size = random(1, 3); // Small star sizes
//    brightness = random(150, 255); // Vary brightness
//    twinkleSpeed = random(0.5, 2); // How fast it twinkles
//  }
//  }
//  void update() {
//    // Slight twinkling effect using sine wave
//    float twinkle = sin(frameCount * 0.05 * twinkleSpeed);
//    brightness = 200 + 55 * twinkle;
//  }
//  void display() {

//  }

//int numStars = 300;      // Number of stars
//Star[] stars = new Star[numStars]; // Array of stars
//}
//void setup() {
//  size(800, 600);   // Set your desired canvas size
//  }
//}

//void draw() {
//  background(0); // Black background

//  // Update and display each star
//  for (int i = 0; i < stars.length; i++) {
//    stars[i].update();
//    stars[i].display();
//  }

//  // Optional: Add game elements here
//}
//}
