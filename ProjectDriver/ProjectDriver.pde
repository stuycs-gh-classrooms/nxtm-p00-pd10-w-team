// final variables
final float MAX_SIZE = 10;
final float MIN_SIZE = 2;
final float MAX_MASS = 100;
final float MIN_MASS = 10;
final float EARTH_MASS = 1000;
final float G_CONSTANT = 0.05; // attraction constant
final float S_CONSTANT = 0.01; // spring constant
final int SPRING_LENGTH = 20;
final float DRAG_CONSTANT_1 = 1;
final float DRAG_CONSTANT_2 = DRAG_CONSTANT_1*5;
final float EARTH_GRAVITY_CONSTANT = 10;
final float ABS_CHARGE = 100;
boolean[] toggles;
String[] modes;
int currentSim;
// orbs
Orb[] orbs;
OrbNode front;
FixedOrb sim5Earth;

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
    if (currentSim!=5) {textSize(20);}
    else {textSize(12);}
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
    if (key==' ') {toggles[0] = !toggles[0];} // moving on/off
    if (key=='b') {toggles[1] = !toggles[1];} // bounce on/off
    if (key=='a') {toggles[2] = !toggles[2];} // attraction on/off
    if (key=='r') {boolean[] temp=toggles;setup1();toggles=temp;} // setup if r pressed
    if (key=='=') {addNewOrb();}
    if (key=='-') {removeOrb();}
  }//sim1
  if (currentSim==2) {
    if (key==' ') {toggles[0] = !toggles[0];} // moving on/off
    if (key=='=') {addNewOrbNode();} // add new orb node
    if (key=='b') {toggles[1] = !toggles[1];} // bounce
    if (key=='s') {toggles[2] = !toggles[2];} // springs
    if (key=='-') {getRidOfOrbNode();} // get rid of orb node
    if (key=='r') {boolean[] temp=toggles;setup2();toggles=temp;} // reset
  }
  if (currentSim==3) {
    if (key=='r') {boolean[] temp=toggles;setup3();toggles=temp;}
    if (key==' ') {toggles[0] = !toggles[0];} // moving
    if (key=='=') {addNewOrb();} // add new orb
    if (key=='-') {removeOrb();} // remove orb
    if (key=='b') {toggles[1]=!toggles[1];} // bounces
    if (key=='d') {toggles[2]=!toggles[2];} // drag
    if (key=='g') {toggles[3]=!toggles[3];} // earth gravity
  }
  if (currentSim==4) {
    if (key=='r') {boolean[] temp=toggles;setup4();toggles=temp;}
    if (key==' ') {toggles[0] = !toggles[0];} // moving
    if (key=='=') {addNewOrb();} // add new orb
    if (key=='-') {removeOrb();} // remove orb
    if (key=='b') {toggles[1]=!toggles[1];} // bounces
    if (key=='m') {toggles[2]=!toggles[2];} // magnetics
    if (key=='g') {toggles[3]=!toggles[3];} // earth gravity
  }
  if (currentSim==5) {
    if (key=='r') {boolean[] temp=toggles;setup5();toggles=temp;}
    if (key==' ') {toggles[0] = !toggles[0];} // moving
    if (key=='=') {addNewOrbNode();} // add new orb
    if (key=='-') {getRidOfOrbNode();} // remove orb
    if (key=='b') {toggles[1]=!toggles[1];} // bounces
    if (key=='g') {toggles[5]=!toggles[5];} // earth gravity
    if (key=='d') {toggles[2] = !toggles[2];} // drag
    if (key=='a') {toggles[3] = !toggles[3];} // attraction
    if (key=='s') {toggles[4] = !toggles[4];} // springs
    if (key=='c') {toggles[6] = !toggles[6];} // collisions
  }
}

// setups
void setup1() {
  front = null;
  String[] tempModes = {"Moving( )", "Bounce(b)", "Attraction(a)","Add one(=)","One less(-)"};
  modes = tempModes;
  toggles=new boolean[tempModes.length];
  orbs = new Orb[((int)random(5) + 4)];
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
  String[] tempModes = {"Moving( )","Bounce(b)","Springs(s)","Add new(=)","One less(-)"};
  modes = tempModes;
  toggles = new boolean[tempModes.length];
  currentSim=2;
  front = new OrbNode();
  int tempNum = (int)random(5) + 4;
  for (int i=0;i<tempNum;i++) {addNewOrbNode();}
  toggles[1] = true;
  toggles[2] = true;
}

void setup3() {
  currentSim=3;
  front = null;
  orbs = new Orb[(int)random(5)+4];
  String[] tempModes = {"Moving( )","Bounce(b)","Drag(d)","Gravity(g)","Add new(=)","One less(-)"};
  modes = tempModes;
  toggles = new boolean[tempModes.length];
  for (int i=0;i<orbs.length;i++) {
    orbs[i] = new Orb();
  }
  toggles[1] = true;
  toggles[2] = true;
  toggles[3] = true;
}

void setup4() {
  currentSim=4;
  front = null;
  orbs = new Orb[(int)random(5)+1];
  String[] tempModes = {"Moving( )","Bounce(b)","Magnetics(m)","Gravity(g)","Add new(=)","One less(-)"};
  modes = tempModes;
  toggles = new boolean[tempModes.length];
  for (int i=0;i<orbs.length;i++) {orbs[i]=new Orb();}
  toggles[1] = true;
  toggles[2] = true;
  //toggles[3] = true;
}

void setup5() {
  currentSim=5;
  front = new OrbNode();
  int rA = (int)random(15) + 5;
  for (int i=0;i<rA;i++) {addNewOrbNode();}
  orbs = null;
  sim5Earth = new FixedOrb((float)width/2,(float)height/2,EARTH_MASS);
  String[] tempModes = {"Moving( )","Bounce(b)","Drag(d)","Attraction(a)","Springs(s)","Gravity(g)","Collide(c)","Add new(=)","One less(-)"};
  modes = tempModes;
  toggles = new boolean[tempModes.length];
  toggles[1] = true; // bounce
  toggles[2] = true;
  toggles[3] = true;
  toggles[4] = true;
  toggles[5] = true;
  toggles[6] = true;
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
  OrbNode currentOrb = front;
  while (currentOrb!=null) {
    // moving/bounce
    if (toggles[0]) {
      if (toggles[2]) {
        currentOrb.applySprings(SPRING_LENGTH,S_CONSTANT);
      }
      currentOrb.move(toggles[1]);
    }
    
    // display
    currentOrb.display();
    if (toggles[2]) {currentOrb.display(SPRING_LENGTH);}
    // next
    currentOrb = currentOrb.next;
  }
}

void draw3() {
  // draw drag areas if drag enabled
  if (toggles[2]) {
    fill(#1efac7);
    rect(0,height/2,width,height/4);
    fill(#f7a19e);
    rect(0,3*height/4,width,height/4);
  }
  // loop through
  for (int i=0;i<orbs.length;i++) {
    // if moving
    if (toggles[0]) {
      // drag
      if (toggles[2]) {
        if (orbs[i].center.y>(height/2)&&orbs[i].center.y<(3*height/4)) {
          orbs[i].applyForce(orbs[i].getDragForce(DRAG_CONSTANT_1));
        }
        if (orbs[i].center.y>height*3/4&&orbs[i].center.y<height) {
          orbs[i].applyForce(orbs[i].getDragForce(DRAG_CONSTANT_2));
        }
      }
      // earth gravity
      if (toggles[3]) {
        orbs[i].applyForce(orbs[i].getEarthGravity(EARTH_GRAVITY_CONSTANT));
      }
      orbs[i].move(toggles[1]);
    }
    
    orbs[i].display();
  }
}

void draw4() {
  // loop through
  for (int i=0;i<orbs.length;i++) {
    // if moving
    if (toggles[0]) {
      if (toggles[2]) {
        for (int i2=0;i2<orbs.length;i2++) {
          if (i!=i2) {
            // collision check
            if (orbs[i].collisionCheck(orbs[i2])) {
              orbs[i].velocity.mult(-1);
            }
            // magneticism
            orbs[i].applyForce(orbs[i].getMagneticForce(orbs[i2]));
          }
        }
      }
      // earth gravity
      if (toggles[3]) {
        orbs[i].applyForce(orbs[i].getEarthGravity(EARTH_GRAVITY_CONSTANT));
      }
      orbs[i].move(toggles[1]);
    }
    orbs[i].display();
    orbs[i].showMagneticSigns();
  }
}

void draw5() {
  // draw drag areas if drag enabled
  if (toggles[2]) {
    fill(#1efac7);
    rect(0,height/2,width,height/4);
    fill(#f7a19e);
    rect(0,3*height/4,width,height/4);
  }
  OrbNode currentOrb = front;
  while (currentOrb!=null) {
    if (toggles[0]) {
      // drag
      if (toggles[2]) {
        if (currentOrb.center.y>height/2&&currentOrb.center.y<3*height/4) {
          currentOrb.applyForce(currentOrb.getDragForce(DRAG_CONSTANT_1));
        } else if (currentOrb.center.y>3*height/4&&currentOrb.center.y<height) {
          currentOrb.applyForce(currentOrb.getDragForce(DRAG_CONSTANT_2));
        }
      }
      // attraction
      if (toggles[3]) {
        currentOrb.applyForce(currentOrb.getGravity(sim5Earth,G_CONSTANT));
        OrbNode n2 = front;
        while (n2!=null) {
          if (currentOrb!=n2) {
            currentOrb.applyForce(currentOrb.getGravity(n2,G_CONSTANT));
          }
          n2 = n2.next;
        }
      }
      // springs
      if (toggles[4]) {
        currentOrb.applySprings(SPRING_LENGTH,S_CONSTANT);
      }
      // gravity
      if (toggles[5]) {
        currentOrb.applyForce(currentOrb.getEarthGravity(EARTH_GRAVITY_CONSTANT));
      }
      // collide
      if (toggles[6]) {
        if (currentOrb.collisionCheck(sim5Earth)) {
          currentOrb.velocity.mult(-1);
        }
        OrbNode n2 = front;
        while (n2!=null) {
          if (currentOrb!=n2&&currentOrb.collisionCheck(n2)) {
            currentOrb.velocity.mult(-1);
          }
          n2 = n2.next;
        }
      }
      // move/bounce
      currentOrb.move(toggles[1]);
    }
    // display
    currentOrb.display();
    if (toggles[4]) {currentOrb.display(SPRING_LENGTH);}
    // transition to next
    currentOrb = currentOrb.next;
  }
  sim5Earth.display();
}

void addNewOrbNode() {
  OrbNode xDNode = front;
  front = new OrbNode();
  xDNode.previous = front;
  front.next = xDNode;
}

void getRidOfOrbNode() {
  if (front!=null && front.next!=null) {
    front = front.next;
  }
}

void addNewOrb() {
  if (orbs!=null) {
    Orb[] temp = new Orb[orbs.length+1];
    for (int i=0;i<orbs.length;i++) {temp[i] = orbs[i];}
    temp[temp.length-1] = new Orb();
    orbs = temp;
  }
}

void removeOrb() {
  if (orbs!=null&&orbs.length>1) {
    Orb[] temp = new Orb[orbs.length-1];
    for (int i=0;i<temp.length;i++) {temp[i] = orbs[i];}
    orbs = temp;
  }
}
