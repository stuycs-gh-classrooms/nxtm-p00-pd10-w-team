class SimOne extends Simulation {
  
  // GRAVITY SIM
  
  boolean[] toggles = new boolean[6];
  String[] modes = {"Moving( )", "Bounce(b)", "Gravity(g)", "Drag(d)", "Earth-Gravity(e)","Spring(s)"};
  
  Orb[] orbs;
  
  SimOne(int numNodes) {
    orbs = new Orb[numNodes];
    for (int i=0;i<orbs.length;i++) {
      orbs[i] = new Orb();
    }
  }
  SimOne() {
    this(1);
  }
  
  void run() {
    
  }
  
}
