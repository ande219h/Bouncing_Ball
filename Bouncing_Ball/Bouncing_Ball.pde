//Variabler
float SquX=0, SquY=0, SquSize=500;
float ballX=21, ballY=21, ballR=30;
float ballSpX=3.5, ballSpY=3.5, SquSp=.1;

//setup køres
void setup() {
  size(500, 500);
}

//figurtegningsfunktion
void figur() {
  //kvadratet har hvide kanter og sort udfyldning.
  stroke(255);
  fill(0);
  square(SquX, SquY, SquSize);
  //bolden laves blå og kanten fjernes
  fill(12, 50, 200);
  noStroke();
  circle(ballX, ballY, ballR);
}

//bevægelsesfunktion
void move() {
  //kvadratets bevægelser
  SquX+=SquSp;
  SquY+=SquSp;
  SquSize=SquSize-2*SquSp;

  //boldens bevægelser
  ballX+=ballSpX;
  ballY+=ballSpY;

  //bolden skal vende om når den rammer en af kvadratets vertikale linjer
  if (ballX<SquX+ballR/2) {
    ballSpX=sqrt(sq(ballSpX));
  } else if (ballX>SquSize+SquX-ballR/2) {
    ballSpX=-sqrt(sq(ballSpX));
  }

  //bolden skal vende om når den rammer en af kvadratets horisontale linjer
  if (ballY>SquSize+SquY-ballR/2) {
    ballSpY=-sqrt(sq(ballSpY))+0.1;
  } else if (ballY<SquY+ballR/2) {
    ballSpY=sqrt(sq(ballSpY));
  }
}

//draw
void draw() {
  clear();
  move();
  figur();
  if (SquSize<ballR+30) {
    noLoop();
  }
}
