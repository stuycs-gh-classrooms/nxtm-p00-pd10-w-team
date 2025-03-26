class OrbNode extends Orb {
  
    //attributes aka instance variables
    OrbNode next;
    OrbNode previous;
    
    void display(int springLength) {
      super.display();
      if (next!=null) {
        if (PVector.dist(center,next.center)>springLength) { // if stretched
          stroke(255,0,0);
        } else if (PVector.dist(center,next.center)<springLength) { // if compressed
          stroke(0,255,0);
        } else { // if normal
          stroke(0);
        }
        //line(0,100,width,100); // test line
        line(center.x,center.y,next.center.x,next.center.y);
      }
      if (previous!=null) {
        if (PVector.dist(center,previous.center)>springLength) { // if stretched
          stroke(255,0,0);
        } else if (PVector.dist(center,previous.center)<springLength) { // if compressed
          stroke(0,255,0);
        } else { // if normal
          stroke(0);
        }
        line(center.x,center.y,previous.center.x,previous.center.y);
      }
    }
    
    void applySprings(int springLength, float springK) {
      if (next!=null) {
        applyForce(getSpring(next,springLength,springK));
      }
      if (previous!=null) {
        applyForce(getSpring(previous,springLength,springK));
      }
    }

}//OrbNode
