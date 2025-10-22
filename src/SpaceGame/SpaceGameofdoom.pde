// Ethan Shafran | Sep 17 2025 | SpaceGame
Spaceship rocket;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<PowerUp> powups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
Timer rockTimer, puTimer;
PImage gameOverScreen;
int score, ammo;
boolean play;
int m, n;
int level;
PImage startscreen;
float accuracy;
int shotsFired;
int shotsHit;
void setup() {
  gameOverScreen = loadImage("gameoverscreen.png");
  m = mouseX;
  n = mouseY;
  size(1000, 1000);
  background(30, 0, 0);
  rocket = new Spaceship();
  rockTimer = new Timer(int(random(500, 1000)));
  puTimer = new Timer(2000);
  rockTimer.start();
  puTimer.start();
  ammo = 100;
  accuracy = 0.0;
  shotsFired = 0;
  shotsHit = 0;
  play = false;
  level = 1;
  startscreen = loadImage("startscreen.png");
}
void draw() {
  if (play == false) {
    startScreen();
  } else {
    if (!play) {
      startScreen();
      if (mousePressed) {
        play = true;
      }
    } else {
      background(22);

      //Star.display();
      stars.add(new Star());
      for (int i = 0; i < stars.size(); i++) {
        Star star = stars.get(i);
        star.display();
        star.move();
        if (star.reachedBottom()) {
          i--;
          stars.remove(star);
        }
        if (rockTimer.isFinished()) {
          rocks.add(new Rock());
          rockTimer.start();
        }
      }
      //Rocks
      for (int i = 0; i < rocks.size(); i++) {
        Rock rock = rocks.get(i);
        rock.display();
        rock.move();

        if (rocket.intersect(rock)) {
          rocks.remove(rock);
          score-=100;
          rocket.health-=10;
        }

        if (rock.reachedBottom()) {
          i --;
          rocks.remove(0);
        }
        println("Rocks: " + rocks.size());
      }// power ups
      for (int i = 0; i < powups.size(); i++) {
        PowerUp pu = powups.get(i);
        pu.display();
        pu.move();

        if (pu.intersect(rocket)) {
          if (pu.type == 'h') {
            // Remove Powerup
            rocket.health += 100;
            powups.remove(pu);
            // Based on type, benefit player

            println("PowerUps: " + powups.size());
          } else if (pu.type == 'a') {
            powups.remove(pu);
            // Based on type, benefit player

            rocket.ammo += 100;
          } else if (pu.type == 's') {
            powups.remove(pu);
            // Based on type, benefit player

            score *= 2;
          }
        }

        if (pu.reachedBottom()) {
          i --;
          powups.remove(0);
        }
      }
      for (int i = 0; i < lasers.size(); i++) {
        Laser laser = lasers.get(i);
        for (int j = 0; j <rocks.size(); j++) {
          Rock r = rocks.get(j);
          if (laser.intersect(r)) {
            lasers.remove(laser);
            r.diam -= r.diam;
            if (r.diam<5) {
              rocks.remove(r);
            }
            score+=10;
          }
        }
        for (int j = 0; j <powups.size(); j++) {
          PowerUp pu = powups.get(j);
          if (laser.intersect(pu)) {
            lasers.remove(laser);
            pu.w -= pu.w;
            if (pu.w<5) {
              powups.remove(pu);
            }
            score+=10;
          }
        }

        laser.display();
        laser.move();
        if (laser.reachedTop()) {
          lasers.remove(laser);
        }
      }



      // replace rocks with powerups
      if (puTimer.isFinished()) {
        powups.add(new PowerUp());
        puTimer.start();
      }
      rocket.display();
      rocket.move(mouseX, mouseY);
      //rock1.display();
      //rock1.move();
      infoPanel();
      //Star[c].update();
      //Stars[c].display();
      healthBar();
      if (rocket.health<10) {
        gameOver();
      }
    }
  }
}

void mousePressed() {
  if (rocket.ammo > 0) {
    lasers.add(new Laser(rocket.x, rocket.y));
    rocket.ammo--;
    shotsFired++;
  }
  
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, height-25, width, 50);
  fill(255);
  // textMode(CENTER);
  // as a result of gaining health, health bar will increase
  textSize(30);
  text("Score: " + score, 30, width - 20);
  text("Health " + rocket.health, 300, width - 20);
  text("Ammo: " + rocket.ammo, width -200, width-20 );

  //text("Mouse Pos. " + m, n);
}

void healthBar() {
  rectMode(CORNER);
  fill(255, 0, 0);
  rect(width-950, height-200, 100, 20);
  fill(0, 200, 0);
  rect(width-950, height-200, rocket.health, 20);
  noStroke();

  fill(255, 0, 0);
  rect(width+950, height+ 950, rocket.health, 200);
}


void startScreen() {
  image(startscreen, 0, 0);
  if (mousePressed) {
    play = true;
  }
}
void gameOver() {
  image(gameOverScreen, width/2, height/2);
  accuracy = (shotsHit / shotsFired) * 100;
  textSize(50);
  fill(255);
  text("accuracy: " + accuracy, 70, 400);
  noLoop();
}
