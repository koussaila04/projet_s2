class Soleil {
  float x;
  float y;
  float taille;
  float r, g, b;

  Soleil(float x, float y, float taille, float r, float g, float b) {
    this.x=x;
    this.y=y;
    this.taille=taille;
    this.r=r;
    this.g=g;
    this.b=b;
  }

  void dessiner() {
    noStroke();
    strokeWeight(1);
    fill(r, g, b);
    ellipseMode(CENTER);
    arc(x, y, taille, taille, HALF_PI, PI);
  }

  void nuit(Voiture v ) {
    if (partie == 1 && v.x < width/64) {
      r--;
      g--;
      b+=1.5;
    } else {
      r-=0.017;
      g-=0.017;
      b+=0.047;
    }
    r=constrain(r, 37, 256);
    g=constrain(g, 88, 256);
    b=constrain(b, 19, 124);
  }
}
