class Ciel {
  float x;
  float y;
  float largeur;
  float hauteur;
  float r, g, b;
  Nuage[] Nuage;
  Soleil soleil;

  Ciel(float x, float y, float largeur, float hauteur, float r, float g, float b) {
    this.x=x;
    this.y=y;
    this.largeur=largeur;
    this.hauteur=hauteur;
    this.r =r;
    this.g =g;
    this.b =b;
    Nuage = new Nuage[5];
    soleil = new Soleil(width, 0, 300, 253, 184, 19);
    for (int i =0; i<Nuage.length; i++) {
      Nuage[i] = new Nuage(width/8+(i*width/5.2), height/3.3, 1, 208, 204, 204);
    }
  }

  void dessiner() {
    noStroke();
    strokeWeight(1);
    fill(r, g, b);
    rect(x, y, largeur, largeur);
    soleil.dessiner();
    for (int i =0; i<Nuage.length; i++) {
      Nuage[i].dessiner();
    }
  }

  void nuit(Voiture v) {
    soleil.nuit(voiture);
    for (int i =0; i<Nuage.length; i++) {
      Nuage[i].nuit(voiture);
    }
    if ( partie == 1  && v.x < width/64 ) {
      r-=1;
      g-=1;
      b-=1;
    } else {
      r-=0.017;
      g-=0.017;
      b-=0.017;
    }
    r=constrain(r, 4, 256);
    g=constrain(g, 26, 256);
    b=constrain(b, 64, 256);
  }
}
