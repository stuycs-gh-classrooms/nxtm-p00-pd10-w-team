class Orb {

  //instance variables
  PVector center;
  PVector velocity;
  PVector acceleration;
  float bsize;
  float mass;
  color c;
  float charge;


  Orb() {
    bsize = random(10, MAX_SIZE);
    float x = random(bsize/2, width-bsize/2);
    float y = random(bsize/2, height-bsize/2);
    center = new PVector(x, y);
    mass = random(10, 100);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
    //charge = 0; // neutral
    if (random(1)>0.5) {
      // make it positive
      charge = ABS_CHARGE;
    } else {
      // make it negative
      charge = -ABS_CHARGE;
    }
  }

  Orb(float x, float y, float s, float m) {
    bsize = s;
    mass = m;
    center = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
  }

  Orb(float x, float y) {
    this();
    center.x = x;
    center.y = y;
  }

  //movement behavior
  void move(boolean bounce) {
    if (bounce) {
      xBounce();
      yBounce();
    }

    velocity.add(acceleration);
    center.add(velocity);
    acceleration.mult(0);
  }//move

  void applyForce(PVector force) {
    PVector scaleForce = force.copy();
    scaleForce.div(mass);
    acceleration.add(scaleForce);
  }

  PVector getDragForce(float cd) {
    float dragMag = velocity.mag();
    dragMag = -0.5 * dragMag * dragMag * cd;
    PVector dragForce = velocity.copy();
    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;
  }

  PVector getGravity(Orb other, float G) {
    float strength = G * mass*other.mass;
    //dont want to divide by 0!
    float r = max(center.dist(other.center), MIN_SIZE);
    strength = strength/ pow(r, 2);
    PVector force = other.center.copy();
    force.sub(center);
    force.mult(strength);
    return force;
  }

  //spring force between calling orb and other
  PVector getSpring(Orb other, int springLength, float springK) {
    PVector direction = PVector.sub(other.center, this.center);
    direction.normalize();

    float displacement = this.center.dist(other.center) - springLength;
    float mag = springK * displacement;
    direction.mult(mag);

    return direction;
  }//getSpring

  boolean yBounce() {
    if (center.y > height - bsize/2) {
      velocity.y *= -1;
      center.y = height - bsize/2;

      return true;
    }//bottom bounce
    else if (center.y < bsize/2) {
      velocity.y*= -1;
      center.y = bsize/2;
      return true;
    }
    return false;
  }//yBounce
  boolean xBounce() {
    if (center.x > width - bsize/2) {
      center.x = width - bsize/2;
      velocity.x *= -1;
      return true;
    } else if (center.x < bsize/2) {
      center.x = bsize/2;
      velocity.x *= -1;
      return true;
    }
    return false;
  }//xbounce

  boolean collisionCheck(Orb other) {
    return ( this.center.dist(other.center)
      <= (this.bsize/2 + other.bsize/2) );
  }//collisionCheck

  boolean isSelected(float x, float y) {
    float d = dist(x, y, center.x, center.y);
    return d < bsize/2;
  }//isSelected

  void setColor() {
    color c0 = color(0, 255, 255);
    color c1 = color(0);
    c = lerpColor(c0, c1, (mass-MIN_SIZE)/(MAX_MASS-MIN_SIZE));
  }//setColor

  //visual behavior
  void display() {
    noStroke();
    fill(c);
    circle(center.x, center.y, bsize);
    fill(0);
    //text(mass, center.x, center.y);
  }//display

  void showMagneticSigns() {
    strokeWeight(3);
    if (charge>0) {
      // positive charge
      stroke(0, 255, 0);
      line(center.x, center.y-(bsize/2), center.x, center.y+(bsize/2));
      line(center.x-(bsize/2), center.y, center.x+(bsize/2), center.y);
    } else if (charge<0) {
      // negative charge
      stroke(255, 0, 0);
      line(center.x-(bsize/2), center.y, center.x+(bsize/2), center.y);
    }
  }

  // earth gravity (downward)
  PVector getEarthGravity(float earthConstant) {
    return new PVector(0, earthConstant);
  }

  PVector getOldMagneticForce(Orb other) {
    float dx = other.center.x - center.x;
    float dy = other.center.y - center.y;
    float rSquared = ((dx * dx) + (dy * dy));
    if (rSquared == 0) {
      return new PVector(0, 0);
    }
    float r = sqrt(rSquared);
    float forceMagnitude = (/*k*/1) * abs(charge) * abs(other.charge) / rSquared;
    float forceX = forceMagnitude * dx / r;
    float forceY = forceMagnitude * dy / r;
    if ((charge>0&&other.charge>0)||(charge<0&&other.charge<0)) {
      return new PVector(-forceX,-forceY);
    } else {
      return new PVector(forceX,forceY);
    }
  }
  
  // even less real magnetic force, uses disney physics to make it more visually appealing to viewer
  
  PVector getMagneticForce(Orb other) {
    float dx = other.center.x - center.x;
    float dy = other.center.y - center.y;
    float rSquared = ((dx * dx) + (dy * dy));
    if (rSquared == 0) {
      return new PVector(0, 0);
    }
    float r = sqrt(rSquared);
    float forceMagnitude = (/*k*/1) * abs(charge) * abs(other.charge) / rSquared;
    float forceX = forceMagnitude * dx / r;
    float forceY = forceMagnitude * dy / r;
    if (center.dist(other.center)<bsize) {
      //forceX = forceX * (center.dist(other.center) / tempHighPassFilterDist);
      //forceY = forceY * (center.dist(other.center) / tempHighPassFilterDist);
      //velocity.mult(-1);
      //other.velocity.mult(-1);
      forceX*=0.01;
      forceY*=0.01;
    }
    if ((charge>0&&other.charge>0)||(charge<0&&other.charge<0)) {
      return new PVector(-forceX,-forceY);
    } else {
      return new PVector(forceX,forceY);
    }
  }
  
}//Orb
