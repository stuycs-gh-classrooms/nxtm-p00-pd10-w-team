class FixedOrb extends Orb {
  
  FixedOrb(float x, float y, float s, float m) {
    super(x,y,s,m);
  }
  
  FixedOrb(float x, float y, float m) {
    //this(x,y,random(MAX_SIZE) + MIN_SIZE,m);
    this(x,y,30,m);
  }
  
  FixedOrb() {
    this(random(width),random(height),random(MAX_MASS));
  }
  
  void move(boolean bounce) {
    // overrides
  }
  
  void setColor() {
    c = color(255,0,0);
  }
  
}
