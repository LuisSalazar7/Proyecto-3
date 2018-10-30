class Cloud
{
  float cx, cy, vel;
  Cloud()
  {
    cx = random(width);
    cy = random(20, 140);
    vel = random(0.5, 2);
  }
  Cloud(float cx_, float cy_, float vel_)
  {
    cx = cx_;
    cy = cy_;
    vel = random(vel_/4, vel_);
  }
  void display()
  {
    fill(240);

    pushMatrix();
    ellipseMode(CENTER);
    ellipse(cx-40, cy+18, 46, 46);
    ellipse(cx+3, cy+8, 60, 60);
    ellipse(cx+40, cy+21, 40, 40);
    rectMode(CENTER);
    rect(cx, cy+26, 80, 30);
    popMatrix();
    cx += vel;
    if (cx < -100) {
      cx = width +100;
    }
    if (cx > width+100) {
      cx = -100;
    }
  }
}
