// FINAL VARIABLES
final float MAX_SIZE = 10;
final float MIN_SIZE = 2;
final float MAX_MASS = 100;
final float MIN_MASS = 10;
//boolean[] toggles = new boolean[6];
//String[] modes = {"Moving( )", "Bounce(b)", "Gravity(g)", "Drag(d)", "Earth-Gravity(e)","Spring(s)"};

// variables
Simulation currentSim;

void setup() {
  size(600,600);
  currentSim = new SimOne();
}

void draw() {
  if (currentSim!=null) {displayMode(currentSim.modes,currentSim.toggles);}
  
}

public void displayMode(String[] modes,boolean[] toggles) {
  if (modes!=null&&toggles!=null) {
    println("displaymode not null xd");
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
  if (key=='1') {
    //println("test");
    currentSim = new SimOne();
  }
  if (key=='2') {
    
  }
  if (key=='3') {
    
  }
  if (key=='4') {
    
  }
  if (key=='5') {
    
  }
}
