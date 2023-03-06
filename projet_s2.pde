int partie = 1; // Pour jouer directement à la deuxième partie changez cette valeur en une valeur entière différente de 1
int score=0;
Voiture voiture;
VariablesJeu variablesJeu;
Vaisseau[] vaisseau = new Vaisseau[3];
Ciel [] ciel = new Ciel[2];
Autoroute[] Autoroute = new Autoroute[2];
Vaisseau[] vaisseau2 = new Vaisseau[100];  // Les vaisseau de la partie 2
float hasard;
int nouveau = 1;
float infY =0.5;
float supY =1.2;
float infX =-1;
float supX =2;

void setup() {
  size(1280, 720);
  background(255);
  for ( int i = 0; i< vaisseau.length; i++) {
    vaisseau[i] = new Vaisseau( (1.5*i+1)*width/5, height / -8.7, color(random(256), random(256), random(256)), width/4.26, height/7.2, 1.3, 0);
  }

  voiture = new Voiture();
  
  variablesJeu = new VariablesJeu();

  for (int i = 0; i< ciel.length; i++) {
    ciel[i] = new Ciel (0, 0, width, height-100, 135, 206, 235);
  }

  for (int i = 0; i< Autoroute.length; i++) {
    Autoroute[i] = new Autoroute( 0, height-400, width, height, 93, 83, 65);
  }

  for ( int i = 0; i< vaisseau2.length; i++) {
    hasard=random(0.2, 0.4);
    vaisseau2[i] = new Vaisseau( random(1.2, 4.8)*width/5, height / -8.7, color(random(256), random(256), random(256)), hasard*width/4.26, hasard*height/7.2, random(infY, supY), random(infX, supX));
    supY+=0.3;
    infX-=0.5;
    supX+=0.5;
  }
}

void draw() {
  if (partie == 1) {
    ciel[0].dessiner();
    Autoroute[0].dessiner();
    voiture.allumerLumiere(ciel[0]);
    voiture.dessiner();
    voiture.deplacer();
    variablesJeu.afficher();

    for (int i=0; i<vaisseau.length; i++) {
      vaisseau[i].dessiner();
      vaisseau[i].deplacer(voiture);
    }

    ciel[0].nuit(voiture);
    Autoroute[0].nuit(voiture);
  } else {
    ciel[1].dessiner();
    Autoroute[1].dessiner();
    voiture.allumerLumiere(ciel[1]);
    voiture.dessiner();
    voiture.dessinerArme();
    voiture.deplacer();
    ciel[1].nuit(voiture);
    Autoroute[1].nuit(voiture);
    ciel[1].nuit(voiture);

    vaisseau2[nouveau].dessiner();
    vaisseau2[nouveau].deplacer(voiture);
    vaisseau2[nouveau].rebondir();
    if (voiture.tue(vaisseau2[nouveau])) {
      nouveau++;
      vaisseau2[nouveau].deplacer(voiture);
      score++;
    } else if ( vaisseau2[nouveau].echapper() ) {
      score-- ;
      nouveau++;
      vaisseau2[nouveau].deplacer(voiture);
    }
      variablesJeu.afficher();

  }
}

// si le joueur arrive à la fin de la première partie et clique sur l'un des boutons de la souris, il va jouer la deuxième partie
void mousePressed() {
  if (voiture.x == 0) {
    partie =2;
  }
}
