class SimOne extends Simulation {
  
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
