class Caja{
  float w;
  float h;
  Body b;
  
  Caja( float x_, float y_, float w_, float h_){
    w = w_;
    h = h_;
    BodyDef bd = new BodyDef();
    Vec2 posicionInicial = new Vec2(x_,y_);
    Vec2 posicionEnMundo = box2d.coordPixelsToWorld(posicionInicial);
    bd.position.set(posicionEnMundo);
    bd.type = BodyType.DYNAMIC;
   
    b = box2d.createBody(bd);
    b.setLinearVelocity(new Vec2(random(-5,5),random(4)));
    b.setAngularVelocity(random(-1,1));//esto genera una caja sin movimiento solo caida
    
    //definir su forma 
    PolygonShape ps = new PolygonShape();
    float ancho = box2d.scalarPixelsToWorld(w_);
    float alto = box2d.scalarPixelsToWorld(h_);
    ps.setAsBox(ancho/7,alto/7);
    
    //definir sus caracteristicas 
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.50;
    fd.restitution = 0.10;//rebote con lo demas
    fd.density = 0 ;
    
    b.createFixture(fd);
  }
  
  void display(){
    Vec2 posicion = box2d.getBodyPixelCoord(b);
    float angulo = b.getAngle();
    pushMatrix();
      translate(posicion.x,posicion.y);
      rotate(-angulo);
     
      noStroke();
      fill(255);
      rect(0,0,w,h);
      imageMode(CENTER);
      image(barquito1,-7,-7);
    popMatrix();
  }

}
