PVector vel;
PVector loc;

float x,y,diam;

void setup() {
  //set size of canvas
  size(800, 600);
  
  x = width/2;
  y = height/2;
  diam = random(40,100);
  
  loc = new PVector(random(0,width), random(0,height));

  vel = new PVector(random(-5,5), random(-5,5));
  vel = PVector.random2D();
  vel.mult(5);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x,loc.y, diam, diam);

  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;

  //bounce ball if it hits walls
  if (loc.x + diam/2 >= width) {
    vel.x = -abs(vel.x);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (loc.x - diam/2 <= 0) {
    vel.x = abs(vel.x);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (loc.y + diam/2 >= height) {
    vel.y = -abs(vel.y);
  } else if (loc.y - diam/2 <= 0) {
    vel.y = abs(vel.y);
  }
}