import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*; 
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
PImage barquito1;
PImage bombax;
PImage nubex;
PImage avion1;
PImage avionex2;
PImage avionex3;
PImage avionex4;

Box2DProcessing box2d;

ArrayList<bombas> bomba;
ArrayList<Caja> cajas;
ArrayList<bombas2> bomba2;

limite4 mar;
limite2 derecho;
limite3 izquierdo;
nubes nube;
aviones avion;
aviones2 avion2;
aviones3 avion3;
aviones4 avion4;

Caja una;
PantallaCarga c;


void setup() {
  size(600, 600);
  smooth();

  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  c = new PantallaCarga();

  box2d.listenForCollisions();

  bomba = new ArrayList<bombas>();
  bomba2 = new ArrayList<bombas2>();
  mar = new limite4(200,600,800,150);
  derecho= new limite2(600,0,30,900);
  izquierdo= new limite3(0,150,30,600);
  nube = new nubes(300,30,120,30);
  avion = new aviones(220,80,40,20);
  avion2 = new aviones2(40,20,40,20);
  avion3 = new aviones3(390,80,40,20);
  avion4 = new aviones4(560,20,40,20);

  barquito1 = loadImage ("barquito1.png");
  barquito1.resize(80,60);
  
  bombax = loadImage("bomba.png");
  bombax.resize(20,25);
  
  nubex = loadImage ("nubex.png");
  nubex.resize (500,400);
 avion1 = loadImage ("avion1.png");
 avion1.resize (50,50);
 avionex2 = loadImage ("avionex2.png");
  avionex2.resize (50,50);
 avionex3 = loadImage ("avionex3.png");
  avionex3.resize (50,50);
 avionex4 = loadImage ("avionex4.png");
  avionex4.resize (50,50);
  
  cajas = new ArrayList<Caja>();
  
}

void draw() {
  background(255);
   c.cambio();

  if (random(1) < 0.1) {
    float sz = random(4, 8);
    bomba.add(new bombas(random(width), 20, sz));
    
  }
  
   if (random(1) < 0.1) {
    float sz = random(4, 8);
    bomba2.add(new bombas2(random(width), 20, sz));
    
  }

  box2d.step();
  
  for(Caja c:cajas){
    c.display();

  for (int i = bomba.size()-1; i >= 0; i--) {
    bombas p = bomba.get(i);
    p.display();
    
    if (p.done()) {
     bomba.remove(i);
    }
  }

  for (int i = bomba2.size()-1; i >= 0; i--) {
    bombas2 p = bomba2.get(i);
    p.display();
    
    if (p.done()) {
     bomba2.remove(i);
    }
  }
  
  mar.display();
  derecho.display();
  izquierdo.display();
  nube.display();
  avion.display();
  avion2.display();
  avion3.display();
  avion4.display();

}
}
void beginContact(Contact cp) {
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();

  if (o1.getClass() == bombas.class && o2.getClass() == bombas.class) {
    bombas p1 = (bombas) o1;
    p1.change();
    bombas p2 = (bombas) o2;
    p2.change();
  }
  
  if (o1.getClass() == bombas2.class && o2.getClass() == bombas2.class) {
    bombas2 p1 = (bombas2) o1;
    p1.change();
    bombas2 p2 = (bombas2) o2;
    p2.change();
  }

}

void endContact(Contact cp) {
}

void mousePressed(){
  cajas.add (new Caja(mouseX,mouseY,random(40,20),random(40,20)));
}
