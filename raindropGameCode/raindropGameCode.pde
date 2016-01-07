int score1;                                                   //declares scoreing integer and initializes as "0" 
Bucket b= new Bucket(5);                                   // creates a bucket using the "Bucket" class and b as the name
ArrayList<Raindrop> raindrops = new ArrayList<Raindrop>();   //creates an array list for the class "raindrops"
PVector mouse;                                                //creates a Pvector to use as the mouse location

void setup() {
  size(1200, 800);
  mouse = new PVector();                                      //initializes the mouse as a Pvector 
  raindrops.add(new Raindrop(random(width), 0));              // initializes the raindrop arraylist
}

void draw() {
  mouse.set(mouseX, mouseY);                                       //sets the mouse Pvector as moouseX and mouseY 
  background(0, 200, 255);
  raindrops.add(new Raindrop(random(width), 0));                  //adds a new raindrop to the Arraylist for raindrops as "r" 
  for (int i = raindrops.size()-1; i >= 0; i--) {                 //keeps it from flashing the raindrops
    Raindrop r = raindrops.get(i);                                //gets "r" from the Array List
    r.display();                                                 //uses the function to display the raindrops
    r.fall();                                                    //" to make the raindrops fall
    if (r.contact(mouse)) {     
      r.reset();                                                // in the raindrop hits the bucket, it will reset back to the top
 
      score1++;                                                //if the player hits a raindrop with the bucket, they score a point
      if (r.loc.y > height + r.diam/2) {                       // if the raindrop goes below the screen, it goes back to the top
        r.reset();
      }
    }
    textSize(50);                                
    text(score1, width/2  - 50, 50);                  //>sets the text size, placement and sets it as the score of the game
    textAlign(CENTER); 
    b.display();                                      //displays the bucket
    if (score1> 50) {                               //if the score is greater than 50, the player see's a "win" screen
      background(0);
      textSize(50);                                
      text("Congrats, You scored 50 Points!", width/2  - 50, 50);            
      textAlign(CENTER);
    }
  }
}



class Raindrop {
  PVector loc, vel, grav;
  int diam;             //creates the "raindrop" class by declaring the Pvectors "loc, vel and grav" snf the integer "diam" and the color"c"
  color c;

  Raindrop(float x, float y) {       //shows that the raindrop class needs an x and a y float as a perameter
    loc = new PVector(x, y);
    c = color(255);
    vel = PVector.random2D();             //initializes loc as a new pvector with x and y, c as white, vel as a random vector, multiplies vel by 30, and adds gravity to the velocity
    vel.mult(10);
    diam= 30;
    grav = new PVector(0, .7);
  }

  void fall() {
    vel= vel.add(grav);          //function that adds grav to vel, or gravity to velocity, making it fall
    loc.add(vel);
  }
  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, diam, diam);        //displays the raindrops as ellipses at "x and y" using the variable "diam " as the diameter 
  }
  void reset() {

    loc.x=random(0, width);
    loc.y=0;
    vel = new PVector(0, -4);        //creates the reset function so that if it is started, it will put the raindrop to a random location at x=random y=0

    vel= vel.add(grav);                //also resets the gravity so it is not going too fast
    loc.add(vel);
  }
  boolean contact(PVector bucket) { 
    loc.dist(mouse);
    if (loc.dist(mouse)<diam+b.diam/2) {        //makes a boolean for if the raindrop is touching the bucket or not, it is used to trigger the "reset" function as well as increase score
      return true;
    } else {
      return false;
    }
  }
}