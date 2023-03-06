class Nuage {
  float x;
  float y;
  float taille;
  float r, g, b;

  Nuage() {
    x=width/2;
    y=height/2;
    taille=1;
    r=208;
    g=204;
    b=204;
  }

  Nuage( float x, float y, float taille, float r, float g, float b) {
    this.x=x;
    this.y=y;
    this.taille=taille;
    this.r=r;
    this.g=g;
    this.b=b;
  }

  void dessiner() {
    noStroke();
    fill(r, g, b);

    arc(taille* x, taille* y, taille* width/16, taille* height/8.66, -PI, 0);          // Premier nuage
    arc(taille* (x-60), taille* y, taille*width/28.44, taille*height/15.6, -PI, 0);
    arc(taille* (x+60), taille*  y, taille*width/28.44, taille*height/15.6, -PI, 0);

    arc(taille* x, taille*  y, taille*width/16, taille*height/8.66, -PI, 0);            // Deuxieme nuage
    arc(taille* (x-60), taille* y, taille*width/28.44, taille* height/15.6, -PI, 0);
    arc(taille* (x+60), taille* y, taille*width/28.44, taille*height/15.6, -PI, 0);

    arc(taille* x, taille* y, taille* width/16, taille* height/8.66, -PI, 0);       // Troisieme nuage
    arc(taille* (x-60), taille* y, taille* width/28.44, taille*height/15.6, -PI, 0);
    arc(taille* (x+60), taille* y, taille*width/28.44, taille*height/15.6, -PI, 0);

    arc(taille* x, taille* y, taille*width/16, taille*height/8.66, -PI, 0);           // Quatrieme nuage
    arc(taille* (x-60), taille* y, taille* width/28.44, taille*height/15.6, -PI, 0);
    arc(taille* (x+60), taille* y, taille* width/28.44, taille* height/15.6, -PI, 0);
  }

  void nuit(Voiture v) {
    if (partie == 1 && v.x < width/64) {
      r-=0.5;
      g-=0.5;
      b-=0.5;
    } else {
      r-=0.017;
      g-=0.017;
      b-=0.017;
    }
    r=constrain(r, 70, 256);
    g=constrain(g, 91, 256);
    b=constrain(b, 112, 256);
  }
}
