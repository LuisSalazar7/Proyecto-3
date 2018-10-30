class Ladrillo {
  float x, y, sx, sy;
  Ladrillo(float x_, float y_, float sx_, float sy_) {
    x = x_;
    y = y_;
    sx = sx_;
    sy = sy_;
  }
  void aplicate(color fondo) {
    stroke(20);
    strokeWeight(3);
    rectMode(CENTER);
    fill(fondo);
    rect(x, y, sx, sy, 4);  //----------Cambiar por imagen de avion 
  }
  void accion(float TX, float TY) {
    x += TX;
    y += TY;
  }
}
