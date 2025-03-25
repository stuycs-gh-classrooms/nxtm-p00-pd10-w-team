// FINAL VARIABLES
final float MAX_SIZE = 10;
final float MIN_SIZE = 2;
final float MAX_MASS = 100;
final float MIN_MASS = 10;

// variables
int currentSim;

// SETUP
void setup() {
  currentSim = (int)random(5) + 1;
  simOneSetup();
}

// DRAW
void draw() {
  if (currentSim==1) {
    draw1();
  }
  else if (currentSim==2) {
    draw2();
  }
  else if (currentSim==3) {
    draw3();
  }
  else if (currentSim==4) {
    draw4();
  }
  else if (currentSim==5) {
    draw5();
  }
  else {
    setup();
  }
}

// setup methods
void simOneSetup() {
  currentSim = 1;
}

void simTwoSetup() {
  currentSim = 2;
}

void simThreeSetup() {
  currentSim = 3;
}

void simFourSetup() {
  currentSim = 4;
}

void simFiveSetup() {
  currentSim = 5;
}

// draw methods
void draw1() {
  
}

void draw2() {
  
}

void draw3() {
  
}

void draw4() {
  
}

void draw5() {

}
