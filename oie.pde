int dice1, dice2;
int [] board = new int[64];
int nombreDeJoueurs = 4;
int [] positionJoueur = new int[nombreDeJoueurs];
int [] positionJoueurPrecedente = new int[nombreDeJoueurs];
int [] hotelJoueur = new int[nombreDeJoueurs];
int indexJoueur=0;
boolean [] hasPlayed = new boolean[nombreDeJoueurs];



void setup () {
  for (int i=0; i<=nombreDeJoueurs; i++) {
    hasPlayed[indexJoueur] = false;
  }
  size (700, 400);
  background(5, 167, 120);
  initBoard();
  for (int i=0; i<=nombreDeJoueurs; i++) {
    showPlayer(board[positionJoueur[indexJoueur]], indexJoueur);
  }
}

void draw () {

}

void mouseClicked() {
  if (positionJoueur[indexJoueur] != 63) {
    if (mouseX >= 40 && mouseX <= 70 && mouseY >=100 && mouseY <= 130) {
      if (hotelJoueur[indexJoueur] == 0) {
        lancerDés();
        commencement();
        deplacement();
        hasPlayed[indexJoueur] = true;
        showPlayer(board[positionJoueur[indexJoueur]], indexJoueur);
        specialTiles(positionJoueurPrecedente[indexJoueur]);
      }
      else {
        hotelJoueur[indexJoueur]--;
      }
    }
    indexJoueur++;
    if (indexJoueur >= nombreDeJoueurs) {
      indexJoueur = 0;
    }
  }
}

// Fonctions graphiques

void initBoard () {
  for (int i=0; i<64; i++) {
    fill(211, 117, 45);
    stroke(0);
    rect(20+(i*10), 21, 10, 27);
  }
    for (int i=0; i<64; i++) {
     specialTiles(i);
  }
  for (int j=0; j<64; j++) { // stockage centre x du tableau dans un nouveau tableau
    board[j] = 25+(j*10);
  }
    fill(10, 50, 50);
    stroke(0);
    rect(55, 115, 30, 30);
    fill(255);
    ellipse(55,115,10,10);
}

void showPlayer (int tile, int indexJoueur) {
  rectMode(CENTER);
  fill(10*indexJoueur, 60*indexJoueur, 60*indexJoueur);
  rect(tile, 35, 10, 27);
  fill(250);
  noStroke();
  rect(90, 70, 130,20); // rectangle pour le text position joueur
  fill(10*indexJoueur, 60*indexJoueur, 60*indexJoueur);
  text("Position du joueur : " + positionJoueur[indexJoueur], 40, 70);
}

void specialTiles (int tile) {
  rectMode(CENTER);
  if (tile == 3) {
    fill(23, 8, 165);
    stroke(0);
    rect(25+(tile*10), 35, 10, 27);
  }
  if (tile == 9 || tile == 18 || tile == 27 || tile == 36 || tile == 45 || tile == 54){
    fill(239, 252, 54);
    stroke(0);
    rect(25+(tile*10), 35, 10, 27);
  }
  if (tile == 19) {
    fill(11, 131, 227);
    stroke(0);
    rect(25+(tile*10), 35, 10, 27);
  }
  if (tile == 42) {
    fill(147, 129, 111);
    stroke(0);
    rect(25+(tile*10), 35, 10, 27);
  }
  if (tile == 52) {
    fill(162, 138, 142);
    stroke(0);
    rect(25+(tile*10), 35, 10, 27);
  }
  if (tile == 58) {
    fill(0);
    stroke(0);
    rect(25+(tile*10), 35, 10, 27);
  }
}

// Fonctions logiques

void lancerDés () {
   dice1 = int(random(6)+1);
   dice2 = int(random(6)+1);
}

void deplacement () {
  if (hasPlayed[indexJoueur]){ 
    int position = positionJoueur[indexJoueur];
    int excedent = 0;
    fill(211, 117, 45);
    stroke(0);
    rect(25+(position*10), 35, 10, 27);
     position = position + dice1 + dice2;
     if (position == 9 || position == 18 || position == 27 || position == 36 || position == 45 || position == 54) {
       position = position + dice1 + dice2;
       println("oie !");
       println(position);
     }
     if (position == 19) {
       println("hotel !");
       hotelJoueur[indexJoueur] =2;
     }
     if (position == 42) {
       position = 30;
       println("labyrinthe !");
       println(position);
     }
     if (position == 58) {
       position = 0;
       println("skull !");
       println(position);
     }
     if (position > 63) {
       excedent = position - 63;
       position = position - (excedent*2);
     }
     else if (position == 63) {
       println("Position : " + position + " ! Victoire !");
     }
     positionJoueurPrecedente[indexJoueur] = positionJoueur[indexJoueur];
     positionJoueur[indexJoueur] = position;
    for (int i=0; i<nombreDeJoueurs; i++) {
       if(i!=indexJoueur) {
         if(positionJoueur[indexJoueur] == positionJoueur[i]) {
           println("2 joueurs sur la même case !");
           positionJoueur[i] = positionJoueurPrecedente[indexJoueur];
           showPlayer(board[positionJoueurPrecedente[indexJoueur]], i);
         }
       }
       if (indexJoueur >= nombreDeJoueurs) {
         indexJoueur = 0;
       }
     } 
   }
}

void commencement () {
  if (!hasPlayed[indexJoueur]){ 
    int position = positionJoueur[indexJoueur];
    fill(211, 117, 45);
    stroke(0);
    rect(25+(position*10), 35, 10, 27);
    if ((dice1 == 6 && dice2 == 3) || (dice1 == 3 && dice2 == 6)) {
      position = 26-9;
    }
    if ((dice1 == 4 && dice2 == 5) || (dice1 == 5 && dice2 == 4)) {
      position = 53-9;
    }
    if (dice1 + dice2 == 6) {
       position = 12;
    }
    else {
      position = position + dice1 + dice2;
    }
     positionJoueur[indexJoueur] = position;
     for (int i=0; i<nombreDeJoueurs; i++) {
       if(i!=indexJoueur) {
         if(positionJoueur[indexJoueur] == positionJoueur[i]) {
           println("2 joueurs sur la même case !");
           positionJoueur[i] = positionJoueurPrecedente[indexJoueur];
           showPlayer(board[positionJoueurPrecedente[indexJoueur]], i);
         }
       }
       if (indexJoueur >= nombreDeJoueurs) {
         indexJoueur = 0;
       }
     } 
  }
}

boolean stuck (int indexJoueur) {
  if (positionJoueur[indexJoueur] == 3 || positionJoueur[indexJoueur] == 52) {
    return true;
  }
  else {
    return false;
  }
}

/*   boolean unstuck (int indexJoueur) {
   if (positionJoueur[indexJoueur] == 3 || positionJoueur[indexJoueur] == 52) {
     for (int i = 0; i<nombreDeJoueurs; i++) {
     
     }
   }
}  */
