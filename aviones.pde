class aviones {

  float x;
  float y;
  float w;
  float h;
  
  Body b;

  aviones(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    b.createFixture(sd,1);
    
    b.setUserData(this);
  }

  void display() {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(x,y,w,h);
      imageMode(CENTER);
      image(avionex4,220,80);
      //segundo avion
  }

}
