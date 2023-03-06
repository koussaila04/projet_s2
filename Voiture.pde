class Voiture {
  float x ;
  float y ;
  float vitesse;
  float acceleration ;
  color couleur;
  float taille;

  Voiture() {
    x=width;
    y=height-229;
    acceleration = 0.004;
    vitesse = 0;
    couleur = color(153, 157, 160   );
    taille=1;
  }

  Voiture(float x, float y, float vitesse, float acceleration, color couleur, float taille) {
    this.x= x ;
    this.y=y ;
    this.vitesse=vitesse ;
    this.couleur = couleur;
    this.taille=taille;
    this.acceleration=acceleration;
    vitesse = 0;
  }

  void dessiner() {
    // La caroserie
    stroke(0);
    strokeWeight(0.6);
    fill(couleur);
    rectMode(CORNERS);
    rect((x-150)*taille, (y+50)*taille, (x+150)*taille, (y+100)*taille);

    // Les roues
    fill(4, 3, 9);
    ellipse((x-100)*taille, (y+100)*taille, 50*taille, 50*taille);  // Roue gauche
    ellipse((x+100)*taille, (y+100)*taille, 50*taille, 50*taille);  // Roue droite

    // Les jentes
    fill(101, 101, 101);

    ellipse((x-100)*taille, (y+100)*taille, (30)*taille, (30)*taille);  // Jente gauche
    ellipse((x+100)*taille, (y+100)*taille, (30)*taille, (30)*taille);  // Jente droite

    // Les vitres
    fill(168, 204, 215, 50);  // couleur grise
    quad((x-100)*taille, (y+50)*taille, (x-50)*taille, (y)*taille, (x+50)*taille, (y)*taille, (x+100)*taille, (y+50)*taille);
    line(x*taille, y*taille, x*taille, (y+50)*taille);        // Pour couper en deux vitres

    // Les feux
    noStroke();
    fill(225, 255, 3);
    arc((x-150)*taille, (y+70)*taille, 20*taille, 20*taille, -HALF_PI, HALF_PI);  // Feu de positionnemnt
    fill(#FF7403);
    arc((x-150)*taille, (y+90)*taille, 11*taille, 11*taille, -HALF_PI, HALF_PI);  // Feu de clignotant d'avant
    fill(#FFF8F7);
    arc((x+150)*taille, (y+90)*taille, 11*taille, 11*taille, -HALF_PI, HALF_PI);  // Feu de recul
    fill(#FF7403);
    arc((x+150)*taille, (y+75)*taille, 11*taille, 11*taille, -HALF_PI, HALF_PI);  // Feu de clignotant arière
    fill(#D82511);
    arc((x+150)*taille, (y+60)*taille, 11*taille, 11*taille, -HALF_PI, HALF_PI);  // Feu de stop
  }

  void dessinerArme() {
    fill(68, 68, 85 );
    triangle((x-50)*taille, y*taille, x*taille, (y-30)*taille, (x+50)*taille, y*taille);
  }


  void deplacer() {
    if (keyPressed) {
      if ( key == CODED ) {
        if (partie == 2 ) {
          if (keyCode == UP ) {
            y-=1.5;
          } else if (keyCode == DOWN ) {
            y+=1.5;
          }
          y=constrain(y, 250, 660);
        }
        if ( keyCode == LEFT ) {
          if (partie == 1 ) {
            x -= vitesse;
            vitesse += acceleration;
            vitesse= constrain(vitesse, 0, 3);
          } else {
            x-=5.5;
          }
        } else if (keyCode == RIGHT ) {
          if (partie == 1 ) {
            x += vitesse;
            vitesse += acceleration;
            vitesse= constrain(vitesse, 0, 1);
          } else {
            x+=5.5;
          }
        }
      }
    } else {
      vitesse = 0;
    }
    x = constrain (x, 0, width/1.01);
  }

  void autoPilote() {
    x -= vitesse;
    if ( x*taille + 150 < 0 ) {
      x=(width +150)/taille;
      couleur = color(random(256), random(256), random(256));
    }
  }

  void allumerLumiere(Ciel c) {
    if (c.r <= 4 && c.g <= 26 && c.b<=64 ) {
      noStroke();
      fill(252, 219, 56, 70);
      triangle((x-250)*taille, (y+40)*taille, (x-100)*taille, (y+70)*taille, (x-250)*taille, (y+100)*taille);
    }
  }

  boolean tue (Vaisseau v) {
    return x >= v.x - ( v.tailleHorizontale) /2.0 &&  x <= v.x + ( v.tailleHorizontale ) /2.0 &&
      y-30 <= v.y + ( v.tailleVerticale /2.0 ) && y-10 >= v.y + ( v.tailleVerticale /2.0 ) ;
  }
}
