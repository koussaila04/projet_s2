class Vaisseau {
  float x ;
  float y;
  color couleur;
  color couleurVitre;
  float tailleHorizontale;
  float tailleVerticale;
  float vitesseY;
  float vitesseX;

  Vaisseau(float x, float  y, color couleur, float tailleHorizontale, float tailleVerticale, float vitesseY, float vitesseX ) {
    this.x = x;
    this.y = y;
    this.couleur = couleur;
    this.tailleHorizontale=tailleHorizontale;
    this.tailleVerticale=tailleVerticale;
    this.vitesseY=vitesseY;
    this.vitesseX= vitesseX;
    couleurVitre = color(127, 200);
  }

  void dessiner() {
    stroke(0);
    strokeWeight(tailleHorizontale/100);
    fill(couleur);
    ellipse(x, y, tailleHorizontale, tailleVerticale );
    fill(couleurVitre);
    arc(x, y, tailleHorizontale/2.0, 2*tailleVerticale, -PI, 0);
  }

  void deplacer(Voiture v) {
    x += vitesseX;
    if (partie == 1 ) {
      if (v.x < width/64) {
        y += vitesseY;
        y = constrain(   y, height/-7.8, height/1.55);
      }
    } else {
      y += vitesseY;
      y = constrain(   y, height/-7.8, height+100);
    }
  }

  boolean echapper() {
    return y>height - tailleVerticale / 2.0 ;
  }

  void rebondir () {
    if (x -  tailleHorizontale / 2.0 < 0 || x +  tailleHorizontale / 2.0 > width && y< height -100 ) {
      vitesseX=-vitesseX;
    }
  }
}
