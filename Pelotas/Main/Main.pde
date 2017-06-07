int   timer, rec = 25, elapsed = rec;
byte  aliveNum = 0;  // byte needs to be initialized in JS mode!
 
final static byte FPS = 30, SPD = 6, BOLD = 4, TEXT_SIZE = 25;
final static byte BALL_NUM = 100, BALL_SIZE = 60;
final static Pelota[] Pelotas = new Pelota[BALL_NUM];
 
final static color BG = -1, FG = 0;
final static color NAVY = #000080, SADDLE_BROWN = #904010;
 
final static String GFX = JAVA2D; // use JAVA2D or P2D
/**************************************************************************/
void setup() {
  size(800, 600, GFX);
  frameRate(FPS);
  noSmooth();
  cursor(HAND);
 
  textLeading(TEXT_SIZE);
  textSize(TEXT_SIZE);
 
  stroke(255);
  //strokeWeight(BOLD);
 
  focused = true;  // JavaScript only
 
  for ( byte i=BALL_NUM; i!=0; Pelotas[--i] = new Pelota() );
}
/**************************************************************************/
void draw() {
  background(0);
 
  if (aliveNum == 0)     createPelotas();
  if (!focused)          mouseX = mouseY = -02000;
 
  for ( byte i=BALL_NUM; i!=0; Pelotas[--i].all() );
 
  showScore();
}
/**************************************************************************/
void showScore() {
  //elapsed = (millis() - timer)/1000;  // Java
  elapsed = (int) ( (millis() - timer)/1000 );  // JavaScript
 
  fill(NAVY);
  text("Segundos:\nRecord:\nVivas:", 20, 40);
 
  fill(SADDLE_BROWN);
  text(elapsed + "\n" + rec + "\n" + aliveNum, TEXT_SIZE*6, 40);
}
/**************************************************************************/
void createPelotas() {
  rec = min(rec, elapsed);
 
  for (int i=0; i!=BALL_NUM; i++) {
    int w = (int) random(BALL_SIZE>>1, BALL_SIZE + 1);
    int h = (int) random(10, BALL_SIZE>>1) + w;
 
    int x = (int) random(w>>1, width  - w/2);
    int y = (int) random(h>>1, height - h/2);
 
    int mvX = (int) random(SPD>>1, SPD + 1);
    int mvY = (int) random(1, SPD>>2) + mvX;
 
    color c = (color) random(020 << 20) | (color) random(0100, 0300) << 030;
 
    Pelotas[i].respawn(x, y, w, h, mvX, mvY, c);
  }
 
  aliveNum = BALL_NUM;
  timer = millis();
}