// final variables
final float MAX_SIZE = 10;
final float MIN_SIZE = 2;
final float MAX_MASS = 100;
final float MIN_MASS = 10;
boolean[] toggles;
//boolean[] toggles = new boolean[6];
String[] modes;
//String[] modes = {"Moving( )", "Bounce(b)", "Gravity(g)", "Drag(d)", "Earth-Gravity(e)","Spring(s)"};
int currentSim;
// orbs
Orb[] orbs;
OrbNode front;

void setup() {
  size(600,600);
  currentSim = 1;
  setup1();
  
}

void draw() {
  background(100);
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
    currentSim = 1;
  }
  
  displayMode();
}

public void displayMode() {
  //println("ran method");
  if (toggles!=null) {
    textAlign(LEFT, TOP);
    textSize(20);
    noStroke();
    int spacing = 85;
    int x = 0;
    for (int m=0; m<toggles.length; m++) {
    //set box color  
      if (toggles[m]) { fill(0, 255, 0); }
      else { fill(255, 0, 0); }
      float w = textWidth(modes[m]);
      rect(x, 0, w+5, 20);
      fill(0);
      text(modes[m], x+2, 2);
      x+= w+5;
    }
  }
}

void keyPressed() {
  // change sims
  if (key=='1') {
    setup1();
  }
  if (key=='2') {
    setup2();
  }
  if (key=='3') {
    setup3();
  }
  if (key=='4') {
    setup4();
  }
  if (key=='5') {
    setup5();
  }
  // toggle stuff in sim
  if (currentSim==1) {
    if (key==' ') {
      toggles[0] = !toggles[0];
    }
  }
}

// setups
void setup1() {
  String[] tempModes = {"Moving() ", "Bounce(b)", "Gravity(g)"};
  modes = tempModes;
  toggles=new boolean[tempModes.length];
  currentSim=1;
}
void setup2() {currentSim=2;}
void setup3() {currentSim=3;}
void setup4() {currentSim=4;}
void setup5() {currentSim=5;}

// draws
void draw1() {}
void draw2() {}
void draw3() {}
void draw4() {}
void draw5() {}
