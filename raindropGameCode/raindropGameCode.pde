int count = 1500;
Bucket b= new Bucket(100);
Raindrop[] r= new Raindrop[count];

PVector mouse;   //declare a P
//Raindrop r;      //declare a new Raindrop called r
//Bucket b;
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector(); 
  //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  int i=0;
  while (i<count) {
    r[i]= new Raindrop(random(width),0);
    i++;
   // r = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y positions
 

}
}

void draw() {
  int i=0;
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);
while(i<count){
  //b.disp();
  r[i].fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
  r[i].display();      //display the raindrop
  if (r[i].contact(mouse)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
    r[i].reset();                         //if it is, reset the raindrop
  }
  if (r[i].loc.y > height + r[i].diam/2) {     //check to see if the raindrop goes below the bottom of the screen
    r[i].reset(); 
    //if it does, reset the raindrop
  }
  i++;
}
b.display();
}



class Raindrop {
  PVector loc, vel, grav;
  int diam;
  color c;
  Raindrop(float x, float y) {
    loc = new PVector(x, y);
    c = color(255);
    vel = PVector.random2D();
    vel.mult(10);
    diam= 30;
    grav = new PVector(0, .7);
  }

  void fall() {
    vel= vel.add(grav);
    loc.add(vel);
  }
  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);
  }
  void reset() {
    loc.x=random(0, width);
    loc.y=0;
    vel = PVector.random2D();
    vel.mult(10);
    vel= vel.add(grav);
    loc.add(vel);
  }
  boolean contact(PVector bucket) { 
    loc.dist(mouse);
    if (loc.dist(mouse)<diam+b.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}