// Constantes - Couleurs //<>//

final color NOIR = color(0);
final color BLANC = color(255);
final color ROUGE = color(255, 0, 0);
final color VERT = color(0, 255, 0);
final color BLEU = color(0, 0, 255);

//création des raquettes

Racket rg, rd;
// Etat du jeu

/** Gestion de la pause */
boolean enPause = false;

/** La balle */
Ball ball;

PFont font;
PImage img;


/**
 * Fonction d'initialisation Processing.
 */
void setup()
{
  size(640, 400);
  // on initialise nos objets
  ball = initBall();
  rg = initRacket(BORDER_SPACE, 10, BLEU);
  rd = initRacket(width - BORDER_SPACE, 10, VERT);
  
  font = loadFont("Arial-BoldItalicMT-48.vlw");
}

void keyPressed() {
  if (key==' ') {
    if (enPause) {
      loop();
    } else {
      noLoop();
    }
    enPause = !enPause;
  }
}
/**
 * Fonction de rafraichissement Processing.
 */
void draw()
{
  /*img = loadImage("img/univers.jpg");
  image(img, 0, 0);*/
  background(0);
  line(320, 0, 320, 400);
  stroke(255, 255, 255);
  textFont(font, 20);
  
  textAlign(CENTER);
  text("score", 0,15);
  
  text(rg.cptScore, width/2, 40);
  text(rd.cptScore, width/2+15, 40);
  textFont(font, 20);
 
  showBall(ball); 
  moveBall(ball);
  showRacket(rg);
  showRacket(rd);
 
  if (keyPressed) {
    if (keyCode==UP) {
      racketUp(rg);
    } else if (keyCode==DOWN) {
      racketDown(rg);
    } else if (keyCode==LEFT) {
      racketUp(rd);
    } else if (keyCode==RIGHT) {
      racketDown(rd);
    }
  }
}
