class Bucket {
  PVector loc;
  float diam;
  Bucket(float tdiam) {
    diam=tdiam;
    loc=mouse;
  }
  void display() {


    fill(255, 50, 150);
    ellipse(mouseX, mouseY, diam, diam);
  }
}