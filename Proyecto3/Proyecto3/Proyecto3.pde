//-------------------------------------------------(VARIABLES GLOBALES)-------------------------------------------------------------------

ArrayList <Ladrillo> brick1;
ArrayList <Ladrillo> brick2;

int pantallas;
float x;
float y;
float dx;
float r, g, b;
float t;
TorreAma  E1;
Tower2    E2;
Empire    E3;
LGBT      E4;
ThugLife  E5;

Cloud [] pan1;
Cloud [] pan2;

attack Thor1, Thor2;
int turno;
int U1, U2, eleccion1, eleccion2pantallas;
float nivele;

PImage amarilla;
PImage azul;
PImage empire;
PImage LGBT;
PImage thuglife;
PImage avion;
void setup() {

  size (1200, 700);
  nivele = 400;
  Thor1 = new attack(80, 500);
  Thor2 = new attack(width-80, 500);
  avion = loadImage("avion.png");
  pantallas = 0;  
  amarilla = loadImage("Amarilla.png");
  azul = loadImage("Azul.png");
  empire = loadImage("Empire.png");
  LGBT = loadImage("LGBT.png");
  thuglife = loadImage("ThugLife.png");
  E1 = new TorreAma();
  E2 = new Tower2();
  E3 = new Empire();
  E4 = new LGBT();
  E5 = new ThugLife();

  x = width/2;
  y = height/2;
  dx = 8;
  r = random(255);
  g = random(255);
  b = random(255);
  t = 50;

  pan1 = new Cloud[6];
  for (int x = 0; x < 6; x++) {
    pan1[x] = new Cloud(random(width), random(20, 140), random(-2, 2));
  }
  pan2 = new Cloud[10];
  for (int y = 0; y < 10; y++) {
    pan2[y] = new Cloud(random(width), random(height), random(-2, 2));
  }

  turno = int(random(2));
  brick1 = new ArrayList<Ladrillo>();
  brick2 = new ArrayList<Ladrillo>();

  smooth();
}

void draw () {
  switch (pantallas) {
  case 0: 
    ventana0();  //---------------------------------------------(INTRO)------------------------------------------//
    break;
  case 1: 
    ventana1(); //---------------------------------------------(PERSONAJES)------------------------------------------//
    break;
  case 2: 
    ventana2(); //---------------------------------------------(BATALLA)------------------------------------------//
    break;
  case 3: 
    ventana3();  //---------------------------------------------(FIN)------------------------------------------//
    break;
  }
}

void seleccionPersonaje() {
  switch(key) {
  case'q': 
    U1 = 1; 
    break; //TorreAmarilla
  case'w': 
    U1 = 2; 
    break; //TorreAzul
  case'e': 
    U1 = 3; 
    break; //Empire
  case'r': 
    U1 = 4; 
    break; //LGBT
  case't': 
    U1 = 5; 
    break; //Empire Thug

  case'1': 
    U2 = 1; 
    break; //TorreAmarilla
  case'2': 
    U2 = 2; 
    break; //TorreAzul
  case'3': 
    U2 = 3; 
    break; //Empire
  case'4': 
    U2 = 4; 
    break; //LGBT
  case'5': 
    U2 = 5; 
    break; //Empire Thug
  }
  if (pantallas == 1 && U1 != 0 && U2 != 0)
  {
    pantallas = 2;
  }
  textSize(20);
  fill(20);
  textAlign(CENTER, BOTTOM);
  text("Presiona las teclas de '1 a 5' (Elige jugador 2", width/2, 50);
  textAlign(CENTER, TOP);
  text("Presiona las teclas de 'Q a T' (Elige jugador 1", width/2, 600);
}

void seleccionPersonaje1()
{
  switch(U1)
  {
  case 1:
  
    pushMatrix();
    translate(-10, 0);
    E1.TorreAma();
    popMatrix();

    break;
  case 2:
    pushMatrix();
    translate(-930, 0);
    E2.TorreAzul();
    popMatrix();

    break;

  case 3:

    E3.Empire();

    break;

  case 4:

    E4.LGBT();

    break;
  case 5:

    E5.ThugLife();

    break;
  }
}

void seleccionPersonaje2()
{
  switch(U2)
  {
  case 1:

    pushMatrix();
    translate(870, 0);
    strokeWeight(3);
    E1.TorreAma();
    popMatrix();

    break;
  case 2:  
    strokeWeight(3);
    E2.TorreAzul();               
    break;

  case 3:
    pushMatrix();
    translate(870, 0);
    strokeWeight(3);
    E3.Empire();
    popMatrix();                   

    break;

  case 4:
    pushMatrix();
    translate(900, 0);
    strokeWeight(3);
    E4.LGBT();
    popMatrix();
    break;
  case 5:
    pushMatrix();
    translate(900, 0);
    strokeWeight(3);
    E5.ThugLife();
    popMatrix();

    break;
  }
}


//-------------------------------------------(TECLADO)----------------------------------------------------------------------------------

void keyPressed()
{
  if (pantallas == 0 && key == ' ') {
    pantallas = 1;
  }
  // #controlLad
  if (key == '-' && pantallas == 2 && turno == 0) {   
    turno = 1;
    brick1.add( new Ladrillo(160, nivele, 25, 18));
  }
  if (key == '+' && pantallas == 2  && turno == 1) { 
    turno = 0;
    brick2.add( new Ladrillo(width-160, nivele, 25, 18));
  }


  if (key == BACKSPACE && pantallas == 3) {
    setup();
    Thor1.Healt = 100;
    Thor2.Healt = 100;
    U1 = 0;
    U2 = 0;
    pantallas = 1;
  }

}

//-------------------------------------(FONDO)---------------------------------------------------
void FondoBatalla() {
  background(0, 200, 255);
}

void sel(float px, float py, color g, int player) {
  noStroke();
  fill(g);
  rectMode(CENTER);
  switch(player) {
  case 1: 
    triangle(px-40, py-30, px, py, px+40, py-30); 
    break;
  case 2: 
    triangle(px-40, py+30, px, py, px+40, py+30); 
    break;
  default: 
    rect(px, py, 80, 80); 
    break;
  }
}

void rendicion(float gx, float gy) {
  strokeWeight(3);
  stroke(3);
  rectMode(CORNER);
  fill(#DBD7B8);
  rect(gx, gy, 120, 60);
  rectMode(CORNERS);
  fill(#71614A);
  rect(gx, gy+60, gx+10, height);
}

void ventana0() {
  //---------------------(PANTALLA PRINCIPAL)----------------------------------------------------------------------//
  background(0, 200, 255);
  PFont P = loadFont("04b30-90.vlw");
  noStroke();
  //----------------(NUBES)-----------------------------------------------------------------------------------------//   


  for (int y = 0; y < 10; y++) {
    pan2[y].display();
  }

  fill(20, 240);
  textFont(P);
  textSize(90);
  textAlign(CENTER, CENTER);
  text("TOWER ATTACK", width/2, height/2);
  textSize(24);
  textAlign(CENTER, BOTTOM);
  text("PULSA ESPACIO PARA COMENZAR", width/2, height-15);
}

void ventana1() {

FondoBatalla();
noStroke();
 for (int x = 0; x < 6; x++) {
    pan1[x].display();
  }
 
  pushMatrix();
  scale(0.5);
  translate(300, 250);
  E1.TorreAma();
  popMatrix();

  pushMatrix();
  scale(0.5);
  translate(-250, 250);
  E2.TorreAzul();
  popMatrix();

  pushMatrix();
  scale(0.5);
  translate(1000, 250);
  E3.Empire();
  popMatrix();

  pushMatrix();
  scale(0.5);
  translate(1360, 260);
  strokeWeight(0.7);
  E4.LGBT();
  popMatrix();

  pushMatrix();
  stroke(0);
  scale(0.5);
  translate(1770, 250);
  E5.ThugLife();
  popMatrix();



  seleccionPersonaje();

  switch(U1) {
  case 1: 
    sel(200, height-150, #C6483C, 2); 
    break;
  case 2: 
    sel(390, height-150, #C6483C, 2); 
    break;
  case 3: 
    sel(550, height-150, #C6483C, 2); 
    break;
  case 4: 
    sel(760, height-150, #C6483C, 2); 
    break;
  case 5: 
    sel(950, height-150, #C6483C, 2); 
    break;
  }
  switch(U2) {
  case 1: 
    sel(200, 150, #3C97C6, 1); 
    break;
  case 2: 
    sel(390, 150, #3C97C6, 1); 
    break;
  case 3: 
    sel(550, 150, #3C97C6, 1); 
    break;
  case 4: 
    sel(760, 150, #3C97C6, 1); 
    break;
  case 5: 
    sel(950, 150, #3C97C6, 1); 
    break;
  }
  
}

void ventana2() { 
  
 
  stroke(0);
  rectMode(CORNER); 
  FondoBatalla();

  seleccionPersonaje1();
  seleccionPersonaje2();
  
  for (Ladrillo esc : brick1) {
    Thor2.effect(esc.x, random(0.5, 2)); 
    esc.aplicate(#987F50); 
    esc.accion(28, 0);
  }
  for (Ladrillo esc : brick2) {
    Thor1.effect(esc.x, random(0.5, 2)); 
    esc.aplicate(#E86080); 
    esc.accion(-28, 0);
  }
  
    if (Thor1.Healt <= 3){
  rendicion(100,600); //-----------BanderaBlanca
  }
     if (Thor2.Healt <= 3){
  rendicion(1000,600); //-----------BanderaBlanca
  }
  pushMatrix();
  noStroke();
  for (int x = 0; x < 6; x++) {
    pan1[x].display();
  }

  popMatrix();
  fill(0);
  textSize (20);

  textAlign (LEFT, TOP);
  text ("Presiona - para atacar", 40, 40);

  textAlign (RIGHT, TOP);
  text ("Presiona + para atacar", width-40, 40);

  textAlign (CENTER, TOP);
  text (Thor1.Healt + " :1 <> 2: " + Thor2.Healt, width/2, 40);
}
void ventana3() {

  FondoBatalla();

  for (int y = 0; y < 10; y++) {
    pan2[y].display();
  }

  fill(20);
  textSize(30);
  textAlign(CENTER, TOP);
  if (pantallas == 3) {
    if (Thor1.Healt >= 1) {
      text("Jugador 1: ganador", width/2, (height/2)-40);
      if (Thor2.Healt <= 0) {
        text("Jugador 2: perdedor", width/2, (height/2)+40);
      }
    } else {
      if (Thor2.Healt >= 1) {
        text("Jugador 2: ganador", width/2, (height/2)-40);
        if (Thor1.Healt <= 0) {
          text("Jugador 1: perdedor", width/2, (height/2)+40);
        }
      }
    }
    if (Thor1.Healt == Thor2.Healt || Thor2.Healt == Thor1.Healt) {
      text("Jugador 1 y 2: empate", width/2, height/2);
    }
  }

  textSize(20); 
  textAlign(LEFT, BOTTOM);
  text("Presiona 'Back' para volver a comenzar", 10, height-10);
}
