int dice1, dice2;
int [] board = new int[64];
int nombreDeJoueurs = 4;
int [] positionJoueur = new int[nombreDeJoueurs];
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
  println(mouseX);
  println(mouseY);
  if (positionJoueur[indexJoueur] != 63) {
    if (mouseX >= 40 && mouseX <= 70 && mouseY >=80 && mouseY <= 110) {
      if (!stuck(indexJoueur)) {
        lancerDés();
        commencement();
        deplacement();
        hasPlayed[indexJoueur] = true;
        showPlayer(board[positionJoueur[indexJoueur]], indexJoueur);
      }
    }
    indexJoueur++;
    if (indexJoueur >= nombreDeJoueurs) {
      indexJoueur = 0;
    }
  }
}

void lancerDés () {
   dice1 = int(random(6)+1);
   dice2 = int(random(6)+1);
   int sum = dice1+dice2;
   println("résultat des dés : " + dice1 + " " + dice2);
   println("Total : " + sum);
}

void deplacement () {
  if (hasPlayed[indexJoueur]){ 
    int position = positionJoueur[indexJoueur];
    int excedent = 0;
    println ("position avant déplacement : " + position);
    fill(211, 117, 45);
    stroke(0);
    rect(25+(position*10), 35, 10, 27);
     position = position + dice1 + dice2;
     if (position == 9 || position == 18 || position == 27 || position == 36 || position == 45 || position == 54) {
       position = position + dice1 + dice2;
     }
     if (position == 42) {
       position = 30;
     }
     if (position == 58) {
       position = 0;
     }
     if (position > 63) {
       excedent = position - 63;
       println(excedent);
       position = position - (excedent*2);
       println("recul effectué : " + position);
     }
     else if (position == 63) {
       println("Position : " + position + " ! Victoire !");
     }
     positionJoueur[indexJoueur] = position;
  }
}

void commencement () {
  if (!hasPlayed[indexJoueur]){ 
    int position = positionJoueur[indexJoueur];
    fill(211, 117, 45);
    stroke(0);
    rect(25+(position*10), 35, 10, 27);
    if ((dice1 == 6 && dice2 == 3) || (dice1 == 3 && dice2 == 6)) {
      println("Spécial 6&3 !");
      position = 26;
    }
    if ((dice1 == 4 && dice2 == 5) || (dice1 == 5 && dice2 == 4)) {
      println("Spécial 5&4 !");
      position = 53;
    }
      if (dice1 + dice2 == 6) {
       println("Spécial 6 !");
       position = 12;
    }
    else {
      position = position + dice1 + dice2;
    }
     positionJoueur[indexJoueur] = position;
  }
}

void initBoard () {
  for (int i=0; i<64; i++) {
    fill(211, 117, 45);
    stroke(0);
    rect(20+(i*10), 21, 10, 27);
  }
  for (int j=0; j<64; j++) { // stockage centre x du tableau dans un nouveau tableau
    board[j] = 25+(j*10);
    println("itération : " + j);
    println("valeur du tableau : " + board[j]);
  }
  for (int i = 1; i<nombreDeJoueurs+1; i++) {
    fill(10*i, 50*i, 50*i);
    stroke(0);
    rect(40*i, 80, 30, 30);
  }
}

void showPlayer (int tile, int indexJoueur) {
  rectMode(CENTER);
  fill(10*indexJoueur, 60*indexJoueur, 60*indexJoueur);
  rect(tile, 35, 10, 27); // Le dès
  fill(250);
  noStroke();
  ellipse(85,95,5,5);
  rect(90, 70, 130,20); // rectangle pour le text position joueur
  fill(10*indexJoueur, 60*indexJoueur, 60*indexJoueur);
  text("Position du joueur : " + positionJoueur[indexJoueur], 40, 70);
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
