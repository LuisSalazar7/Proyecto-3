class attack {
  float x, y, WI, HE;
  float ys;
  int Healt;
  float ataque;
  attack(float x_, float y_) {
    x = x_;
    y = y_;
    WI = 120;
    HE = 440;
    ys = y-(HE/2)-90;
    Healt = 100;
  }
  attack(float x_, float y_, float WI_, float HE_) {
    x = x_;
    y = y_;
    WI = WI_;
    HE = HE_;
    Healt = 100;
  }
  void displayZ() {
    rectMode(CENTER);
    stroke(255);
    strokeWeight(2);
    fill(255, 40);
    rect(x, y, WI, HE, 8);
    ellipse(x, y, 3, 3);
  }
  void effect(float xf, float ataque) {
    if (xf < x+(WI/2) && xf > x-(WI/2)) {

      ys += ataque*6.8; // nivel de daño
      Healt -= ataque;

      if (Healt < 0) {
        Healt = 0;
        pantallas = 3;
      }
    
    }
    noStroke();
    fill(0, 200, 255);
    rectMode(CORNERS);
    rect(x-WI*2, y-(HE/2)-85, x+WI*2, ys);
    nivele = ys;
  }
}
