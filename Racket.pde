 /** largeur d'une raquette */
  final int RACKET_WIDTH  = 10;
  /** hauteur d'une raquette */
  final int RACKET_HEIGHT = 40;
  /** vitesse de déplacement vertical d'une raquette */
  final int RACKET_SPEED  = 7;
  /** distance du bord de la fenêtre pour la raquette */
  final int BORDER_SPACE  = 20;

class Racket {
 
  int x;
  int y;
  int largeur;
  int hauteur;
  color col;
  int cptScore;
  PImage raqImg;
}

  Racket initRacket(int lx, int ly, color c) {
    Racket r = new Racket();
    r.x = lx;
    r.y = ly;
    r.largeur = RACKET_WIDTH;
    r.hauteur = RACKET_HEIGHT;
    r.col = c;
    r.cptScore=0;
    r.raqImg = loadImage("img/raq1.png");
    return r;
  }

  void showRacket(Racket r) {
    fill(r.col);
    image(r.raqImg, r.x, r.y);
    //rect(r.x, r.y, r.largeur, r.hauteur);
  }
  
  void racketDown(Racket r) {
    r.y += RACKET_SPEED;
    if (r.y>height-RACKET_HEIGHT) {
      r.y=height-RACKET_HEIGHT;
    }
  }
  
  void racketUp(Racket r) {
    r.y -= RACKET_SPEED;
    if (r.y<0) {
      r.y=0;
    }
  }
