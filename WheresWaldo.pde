int currentScene = -1;
PImage[] scenes = new PImage[7];

void setup() {
  size(700, 850);
  for (int i = 0; i < scenes.length; i++) {
    scenes[i] = loadImage("waldo" + i + ".jpg");
  }
}

void draw() {
  if (currentScene == -1) {
    drawWelcome();
  } else if (currentScene < scenes.length) {
    drawScene(currentScene);
    drawSceneCheckBoxes();
  } else {
    end();
  }
  xy();
  if (currentScene == -1 && overPlay()) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}

void drawWelcome() {
  background(255);
  PImage waldo = loadImage("hello.jpg");
  imageMode(CENTER);
  image(waldo, width / 2, height / 3); // about two thirds up the page
  textAlign(CENTER);
  textSize(64);
  fill(255, 0, 0);
  text("Play", width / 2, 500);
}

void drawSceneCheckBoxes() {
  textAlign(LEFT);
  int cbx = 20;
  int cby = 720;
  int cbw = 15;
  int cbh = 15;
  int tx = cbh + cbw + 10;

  switch(currentScene) {
  case 0:
    fill(255); rect(cbx, cby, cbw, cbh);
    fill(0);   text("Waldo", tx, cby + cbh);
    cby += 20;    
    fill(255); rect(cbx, cby, cbw, cbh);
    fill(0);   text("Wizard Whitebeard", tx, cby + cbh);
    
    break;
  case 1:
    break;
  case 2:
    break;
  case 3:
    break;
  case 4:
    break;
  case 5:
    break;
  case 6:
    break;
  default:
    break;
  }
}

void drawScene(int n) {
  background(255);
  imageMode(CORNER);
  image(scenes[n], 0, 0);
}

void end() {
  background(255);
  textSize(64);
  fill(255, 0, 0);
  text("The End", width / 2, height / 2);
}

boolean overPlay() {
  if (mouseX > 292 && mouseX < 415 && mouseY > 447 && mouseY < 504) {
    return true;
  } else {
    return false;
  }
}

boolean foundWaldo() {
  switch(currentScene) {
  case 0:
    return mouseX > 622 && mouseX < 636 && mouseY > 450 && mouseY < 483;
  case 1:
    return mouseX > 650 && mouseX < 661 && mouseY > 568 && mouseY < 585;
  case 2:
    return mouseX > 516 && mouseX < 542 && mouseY > 79 && mouseY < 130;
  case 3:
    return mouseX > 446 && mouseX < 460 && mouseY > 59 && mouseY < 100;
  case 4:
    return mouseX > 100 && mouseX < 112 && mouseY > 17 && mouseY < 70;
  case 5:
    return mouseX > 159 && mouseX < 170 && mouseY > 241 && mouseY < 256;
  case 6:
    return mouseX > 200 && mouseX < 210 && mouseY > 416 && mouseY < 446;
  default: 
    return false;
  }
}

void mouseClicked() {
  if (currentScene == -1 && overPlay()) {
    currentScene = 0;
  } else if (currentScene > -1 && foundWaldo()) {
    updateUI();
  } else {
    println("that's not Waldo");
  }
}

void updateUI() {
  
}

void xy() {
  textSize(16);
  fill(0);
  text("x: " + mouseX, width - 55, height - 40);
  text("y: " + mouseY, width - 55, height - 20);
}

// interesting to note: the error message thrown during Tweak is "case expressions must be 
// constant expressions" and I think I can beat it if I use an Enum for the state of the scene.