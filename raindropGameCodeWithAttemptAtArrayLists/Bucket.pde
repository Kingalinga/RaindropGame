class Bucket {
  PVector loc;
  float diam;
  Bucket(float tdiam) {
    diam=tdiam;
    loc=mouse;
  }
  void display() {


    fill(0);
    ellipse(mouseX, mouseY, diam, diam);
  }
}
}