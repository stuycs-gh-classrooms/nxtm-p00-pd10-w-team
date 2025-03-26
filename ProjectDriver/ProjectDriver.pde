// final variables
final float MAX_SIZE = 10;
final float MIN_SIZE = 2;
final float MAX_MASS = 100;
final float MIN_MASS = 10;
final float EARTH_MASS = 1000;
final float G_CONSTANT = 0.01;
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
  background(240);
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
      toggles[0] = !toggles[0]; // moving on/off
    }
    if (key=='b') {
      toggles[1] = !toggles[1]; // bounce on/off
    }
    if (key=='g') {
      toggles[2] = !toggles[2]; // gravity on/off
    }
  }
}

// setups
void setup1() {
  front = null;
  String[] tempModes = {"Moving( )", "Bounce(b)", "Gravity(g)"};
  modes = tempModes;
  toggles=new boolean[tempModes.length];
  orbs = new Orb[((int)random(5) + 2)];
  toggles[1] = true;
  toggles[2] = true;
  currentSim=1;
  orbs[0] = new FixedOrb((float)width/2,(float)height/2,EARTH_MASS); // earth
  for (int i=1;i<orbs.length;i++) {
    orbs[i] = new Orb();
  }
}

void setup2() {
  orbs = null;
  String[] tempModes = {"Moving( )","Bounce(b)"};
  modes = tempModes;
  toggles = new boolean[tempModes.length];
  currentSim=2;
  front = new OrbNode();
}

void setup3() {
  currentSim=3;
}

void setup4() {
  currentSim=4;
}

void setup5() {
  currentSim=5;
}

// draws
void draw1() {
  for (int i=0;i<orbs.length;i++) {
    // moving/bounce
    if (toggles[0]) {
      //orbs[i].move(toggles[1]);
    // gravity
    if (toggles[2]) {
      for (int i2=0;i2<orbs.length;i2++) {
        if (i!=i2) {
          orbs[i].applyForce(orbs[i].getGravity(orbs[i2],G_CONSTANT));
        }
      }
    }
    orbs[i].move(toggles[1]);
    }
    orbs[i].display();
    
  }
}

void draw2() {
  
}

void draw3() {
  
}

void draw4() {
  
}

void draw5() {
  
}

void addNewOrbNode() {
  OrbNode xDNode = front;
  front = new OrbNode();
  xDNode.previous = front;
  front.next = xDNode;
}
