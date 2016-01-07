class Bucket {
  PVector loc;
  float diam;                     //creates a class "Bucket" with a float for diameter and vector for location
  Bucket(float tdiam) {
    diam=tdiam;                   //diameter can be chosen by the player before playing to increase difficulty(or decrease)
    loc=mouse;                  //the location of the bucket is set to the vector"mouse"
  }
  void display() {
loc=mouse;

    fill(50, 240, 9);
    ellipse(loc.x, loc.y, diam, diam);           //creates a function to display the bucket as a green ball at the mouse location
  }
}