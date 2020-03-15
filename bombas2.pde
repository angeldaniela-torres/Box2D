class bombas2 {

  Body body;
  float r;

  color col;

 bombas2(float x, float y, float r_) {
    r = r_;
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(175);
  }

  void killBody() {
    box2d.destroyBody(body);
  }

  void change() {
    col = color(175);
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(255);
    stroke(255);
    strokeWeight(1);
    ellipse(0, 0, r*2, r*2);
    imageMode(CENTER);
      image(bombax,-2,-2);//la pocisionn de la bomba dentro del circulo gris
    popMatrix();
  }

  void makeBody(float x, float y, float r) {
    BodyDef bd = new BodyDef();
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = -5;
    fd.friction = 0.01;
    fd.restitution = 0.3;

    body.createFixture(fd);

    body.setAngularVelocity(random(-60, 60));
  }
}
