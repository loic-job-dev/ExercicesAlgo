int dice1, dice2, position = 0;
int [] board = new int[64];

void setup () {
  size (700, 400);
  background(5, 167, 120);
  initBoard();
  showPlayer(board[position]);
}

void draw () {

}

void mouseClicked() {
  println(mouseX);
  println(mouseY);
  if (mouseX >= 70 && mouseX <= 100 && mouseY >=80 && mouseY <= 100) {
    if (position != 63) {
      lancerDés();
      deplacement();
      showPlayer(board[position]);
    }
    else {
      println("victoire !");
    }
  }
}

void lancerDés () {
   dice1 = int(random(5)+1);
   dice2 = int(random(5)+1);
   int sum = dice1+dice2;
   println("résultat des dés : " + dice1 + " " + dice2);
   println("Total : " + sum);
}

void deplacement () {
  int excedent = 0;
  println ("position avant déplacement : " + position);
  fill(211, 117, 45);
  stroke(0);
  rect(25+(position*10), 35, 10, 27);
   position = position + dice1 + dice2;
   if (position > 63) {
     excedent = position - 63;
     println(excedent);
     position = position - (excedent*2);
     println("recul effectué : " + position);
   }
   else if (position == 63) {
     println("Position : " + position + " ! Victoire !");
   }
}

void initBoard () {
  for (int i=0; i<64; i++) {
    fill(211, 117, 45);
    rect(20+(i*10), 21, 10, 27);
  }
  for (int j=0; j<64; j++) { // stockage centre x du tableau dans un nouveau tableau
    board[j] = 25+(j*10);
    println("itération : " + j);
    println("valeur du tableau : " + board[j]);
  }
  fill(156, 230, 250);
  rect(70, 80, 30, 30);
}

void showPlayer (int tile) {
  rectMode(CENTER);
  fill(156, 230, 250);
  rect(tile, 35, 10, 27); // Le dès
  fill(5, 167,120);
  noStroke();
  rect(90, 70, 120,30); // rectangle pour le text position joueur
  fill(255);
  text("Position du joueur : " + position, 40, 70);
}
