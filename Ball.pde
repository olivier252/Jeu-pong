/** largeur (ou diamètre) de la balle */
final int BALL_WIDTH = 10;
/** vitesse de déplacement de la balle */
final int BALL_SPEED = 3;
/** couleur de la balle */
final color BALL_COLOR = BLANC; 

/**
 * Une balle.
 */
class Ball {

  /** abscisse du centre de la balle */
  int x;

  /** ordonnée du centre de la balle */
  int y;

  /** mouvement sur l'axe des abscisses */
  int mvt_x;

  /** mouvement sur l'axe des ordonnées */
  int mvt_y;
  PImage ballImg;
}

/**
 * Initialisation d'une balle : tous les attributs prennent des valeurs par défaut.
 */
Ball initBall() {
  Ball ball = new Ball();
  ball.x = width/2;
  ball.y = height/2;
  ball.mvt_x = BALL_SPEED;
  ball.mvt_y = BALL_SPEED;
  ball.ballImg = loadImage("img/ball.png");
  return ball;
}

/**
 * Affichage de la balle
 */
void showBall(Ball b)
{
  fill(BALL_COLOR);
  //ellipse(b.x, b.y, BALL_WIDTH, BALL_WIDTH);
  image(ball.ballImg, ball.x, ball.y);
}

/**
 * Déplacement de la balle
 */
void moveBall(Ball b)
{
  // Mouvement Horizontal
  b.x += b.mvt_x;
  if (collisionHorizontale(b))
  {
    b.x -= b.mvt_x;// mouvement annulé
    b.mvt_x *= -1; // changement de direction
  }

  // Mouvement Vertical
  b.y += b.mvt_y;
  if (collisionVerticale(b))
  {
    b.y -= b.mvt_y; // mouvement annulé
    b.mvt_y *= -1; // changement de direction
  }
}

/**
 * Retourne vrai si la balle ....
 */
boolean collisionHorizontale(Ball b)
{
  boolean mur_dt =(b.x + BALL_WIDTH*0.5>width);
  boolean mur_gche = (b.x + BALL_WIDTH*0.5<0);
  boolean raqGche = collision( rg.x, rg.y, 10, 40, ball.x, ball.y, BALL_WIDTH/2, BALL_WIDTH/2);
  boolean raqDt = collision( rd.x, rd.y, 10, 40, ball.x, ball.y, BALL_WIDTH/2, BALL_WIDTH/2);
  
  if(mur_dt) {
    rg.cptScore++;
    ball = initBall();
  } else if(mur_gche) {
    rd.cptScore++;
    ball = initBall();
  }
  
    return mur_dt || mur_gche || raqGche || raqDt;
} 
  
                   


/**
 * Retourne vrai si la balle ...
 */
boolean collisionVerticale(Ball b)
{
  return (b.y + BALL_WIDTH/2  > height) || (b.y < 0) || collision( rg.x, rg.y, 10, 40, ball.x, ball.y, BALL_WIDTH/2, BALL_WIDTH/2) || 
                                                     collision( rd.x, rd.y, 10, 40, ball.x, ball.y, BALL_WIDTH/2, BALL_WIDTH/2);
}
