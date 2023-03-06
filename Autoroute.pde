class Autoroute {
  float x;
  float y;
  float largeur;
  float hauteur;
  float r, g, b;
  Voiture[] voiture;
  float yVoiture;
  int cpt;

  Autoroute(float x, float y, float largeur, float hauteur, float r, float g, float b) {
    this.x=x;
    this.y=y;
    this.largeur=largeur;
    this.hauteur=hauteur;
    this.r=r;
    this.g=g;
    this.b=b;
    yVoiture =  (height-90)/0.8;
    cpt=1;
    voiture = new Voiture[11];

    for (int i = 0; i< voiture.length; i++) {
      if (i ==  voiture.length / 3  ) {
        yVoiture= (height-80);
        cpt=1;
      } else if ( i ==  2* voiture.length / 4   ) {
        yVoiture= (height-200);
        cpt=1;
      } else if ( i ==  3* voiture.length / 4   ) {
        yVoiture= (height-340);
        cpt=1;
      }
      voiture[i] = new Voiture(width -300 + (cpt-1)*600, yVoiture, random(1, 3), 0, color(random(256), random(256), random(256)), 0.8);
      cpt++;
    }
  }

  void dessiner() {
    noStroke();
    fill(r, g, b);
    rect(x, y, largeur, hauteur);

    stroke(247, 181, 0);
    strokeWeight(4);
    for ( int i = height - 100; i>y; i-=100) {
      for (int j = 0; j<width; j+= 100 ) {
        line(j, i, j+60, i);
      }
    }
    if (partie ==1 ) {
      for (int i = 0; i<voiture.length; i++) {
        voiture[i].allumerLumiere(ciel[0]);
        voiture[i].dessiner();
        voiture[i].autoPilote();
      }
    } else {
      for (int i = 0; i<voiture.length; i+=4) {
        voiture[i].allumerLumiere(ciel[1]);
        voiture[i].dessiner();
        voiture[i].autoPilote();
      }
    }
  }

  void nuit(Voiture v) {
    if (partie == 1 && v.x < width/64) {
      r--;
      g--;
      b--;
    } else {
      r-=0.017;
      g-=0.017;
      b-=0.017;
    }
    r=constrain(r, 5, 256);
    g=constrain(g, 2, 256);
    b=constrain(b, 19, 256);
  }
}
