int count = 200;

PVector mouse;   //declare a P
Raindrop r;      //declare a new Raindrop called r
//Bucket b;
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test


void setup() {
  size(1200, 800);
  mouse = new PVector();                //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  r = new Raindrop(random(width), 0);   //Initialize r. The parameters used are the initial x and y positions
}

void draw() {
  mouse.set(mouseX, mouseY);             //set value of mouse as mouseX,mouseY
  background(0, 200, 255);

  //b.disp();
  r.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
  r.display();      //display the raindrop
    if (r.contact()) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
     r.reset();                         //if it is, reset the raindrop
   }
  if (r.loc.y > height + r.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
    r.reset();                           //if it does, reset the raindrop
  }
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
    grav = new PVector(0, .5);
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
  boolean contact(){
    boolean a;
  if(loc.dist(mouse)>15){
    return true;}

}
}
//class Bucket {
//  PVector loc;
//  Bucket() {
//    loc= new PVector(mouseX, mouseY);
   
//  }
//  void disp() {
//    fill(50);
//    rect(loc.x-40, loc.y-50, 80, 100);
//  }
//}