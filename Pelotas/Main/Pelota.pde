class Pelota {
  int x, y;
  int w, h, rw, rh;
  int vx, vy;
  color c;
  boolean isDead;
  ///////////////////////////////////////Pelota///////////////////////////////////
  Pelota() {
    isDead = true;
  }
  //////////////////////////////////////////////////////////////////////////
  Pelota(int xx, int yy, int ww, int hh, 
  int spdX, int spdY, color colour) {
    respawn(xx, yy, ww, hh, spdX, spdY, colour);
  }
  //////////////////////////////////////////////////////////////////////////
  void respawn(int xx, int yy, int ww, int hh, int sx, int sy, color ink) {
    x = xx;
    y = yy;
 
    w = ww;
    h = hh;
    rw = ww >> 1;
    rh = hh >> 1;
 
    vx = sx;
    vy = sy;
 
    c = ink;
 
    isDead = false;
  }
  //////////////////////////////////////////////////////////////////////////
  void display() {
    fill(c);
    ellipse(x, y, w, h);
  }
  //////////////////////////////////////////////////////////////////////////
  void update() {
    if ( (x += vx) < rw | x > width  - rw )  vx *= -1;
    if ( (y += vy) < rh | y > height - rh )  vy *= -1;
  }
  //////////////////////////////////////////////////////////////////////////
  boolean isHit() {
    return sq(mouseX - x)/(rw*rw) + sq(mouseY - y)/(rh*rh) < 1;
  }
  //////////////////////////////////////////////////////////////////////////
  void all() {
    if (isDead)   return;
 
    update();
    display();
 
    if ( isDead = isHit() )   --aliveNum;
  }
  //////////////////////////////////////////////////////////////////////////
}