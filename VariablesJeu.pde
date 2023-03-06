class VariablesJeu {
  float taille;
  Voiture v;

  VariablesJeu() {
    taille=30;
    v=voiture;
  }

  VariablesJeu( float taille, Voiture v) {
    this.taille=taille;
    this.v=v;
  }

  void afficher() {
    if (partie == 1 ) {
      fill(255);
      textSize(taille);
      textAlign(CENTER);
      text("Time " + millis() / 1000, width -200, 100);
      textSize(width/24);
      textAlign(CENTER);
      if (v.x > width/1.28) {
        text("Utilsez les fleches pour conduire", width/2, height/2-70);
      } else if ( v.x > width/64 ) {
        text("C'était un bon voyage, jusqu'à que...", width/2, height/2-70);
      } else {
        fill(124, 2, 0);
        text("Les extraterrestres viennent", width/2, height/2-70);
      }
      if (v.x <= 0) {
        textSize(width/35);
        fill(255, 0, 255);
        text("Cliquez sur l'un des bouttons de la souris et commencez à défendre notre planète.", width/2, height/1.07);
      }
      textAlign(LEFT);
      fill(255);
      textSize(taille);
      text("Vitesse : " + int(v.vitesse *40)  +"Km/h", 50, 100 );
    } else {
      fill(255);
      textSize(taille);
      textAlign(CENTER);
      text("Score " + score, 100, 60 );
      if (millis() < 180000 ) {
        text("Time " + millis() / 1000, width -200, 60);
        // le joueur gagne si son score est d'au moins 10 avant 3 minutes
      } else if ( score >= 10 ) {
        rectMode(CORNER);
        fill(0, 172, 80, 70);
        rect(0, 0, width, height);
        fill(0, 255, 0);
        textSize(width/12);
        text("VOUS AVEZ GAGNÉ", width/2, height/2);
        textSize(width/15);
        text("VOTRE SCORE EST : "+score +" >= 10", width/2, 5*height/6);
        noLoop();
      } else {
        rectMode(CORNER);
        fill(242, 169, 191, 70);
        rect(0, 0, width, height);
        fill(255, 0, 0);
        textSize(width/12);
        text("VOUS AVEZ PERDU", width/2, height/2);
        textSize(width/15);
        text("VOTRE SCORE EST : "+score +" < 10", width/2, 5*height/6);
        noLoop();
      }
    }
  }
}
