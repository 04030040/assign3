//You should implement your assign3 here.

//game state case number
final int gameStart=1, gameWin=2, gameLose=3, gameRun=4;
int gameState=0;
char gameLevel;

int hpValue;
int treasurePosX;
int treasurePosY;
float enemy1PosX;
float enemy1PosY;
int fighterPosX;
int fighterPosY;

int bg1PosX;
int bg2PosX;
int enemySpeedX;
int enemySpeedY;
int treasureSpeedX;

int strtBnLftBrdrX;
int strtBnRtBrdrX;
int strtBnUpBrdrY;
int strtBnLwBrdrY;
int endBnLftBrdrX;
int endBnRtBrdrX;
int endBnUpBrdrY;
int endBnLwBrdrY;

int fEDis;
int fTDis;
int enemySize;

int i, j, k, l, m, n;

PImage backgroundImg1;
PImage backgroundImg2;
PImage fighterimg;
PImage hpImg;
PImage enemyImg;
PImage treasureImg;
PImage startImg1;
PImage startImg2;
PImage endImg1;
PImage endImg2;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

void setup(){
size (640, 480);
gameState=gameStart;

gameLevel='1';

backgroundImg1=loadImage("img/bg1.png");
backgroundImg2=loadImage("img/bg2.png");
fighterimg = loadImage("img/fighter.png");
hpImg=loadImage("img/hp.png");
enemyImg = loadImage("img/enemy.png");
treasureImg = loadImage("img/treasure.png");
startImg1 = loadImage("img/start1.png");
startImg2 = loadImage("img/start2.png");
endImg1 = loadImage("img/end1.png");
endImg2 = loadImage("img/end2.png");
enemy1PosX=0;
enemy1PosY=0;
bg1PosX=0;
bg2PosX=-641;
enemySpeedX=2;
enemySpeedY=2;
treasureSpeedX=3;

// start Button Left Boarder X position 
strtBnLftBrdrX=206;
// start Button Right Boarder X position 
strtBnRtBrdrX=444;
// start Button Upper Boarder Y position 
strtBnUpBrdrY=376;
// start Button Lower Boarder Y position 
strtBnLwBrdrY=413;
// end Button Left Boarder X position 
endBnLftBrdrX=209;
// end Button Right Boarder X position 
endBnRtBrdrX=422;
// end Button Upper Boarder Y position 
endBnUpBrdrY=310;
// end Button Lower Boarder Y position 
endBnLwBrdrY=346;

//distance between fighter and enemy
fEDis=55;
//distance between fighter and treasure
fTDis=45;
//Size of enymy
enemySize=61;

i=0;
j=0;
k=0;
l=0;
m=0;
n=0;
}

void mousePressed(){
println("mousePressed");
println("mouseX, Y =", mouseX, ", ", mouseY);
if (gameState==gameStart &&
// start Button
mouseX>strtBnLftBrdrX&&mouseX<strtBnRtBrdrX&&mouseY>strtBnUpBrdrY&&mouseY<strtBnLwBrdrY){
gameState=gameRun;
hpValue=20;
}
else if (gameState==gameLose &&
//end Button
mouseX>endBnLftBrdrX&&mouseX<endBnRtBrdrX&&mouseY>endBnUpBrdrY&&mouseY<endBnLwBrdrY
){
gameState=gameStart;
}
else if (gameState==gameWin){gameState=gameStart;}
else{println("mousePressed else");}
}


//fighter position controlled by keyboard
void keyPressed() {
if (key == CODED) {
switch (keyCode) {
case UP:
upPressed = true;
println("upPressed");
break;
case DOWN:
downPressed = true;
println("downPressed");
break;
case LEFT:
leftPressed = true;
println("leftPressed");
break;
case RIGHT:
rightPressed = true;
println("rightPressed");
break;
}
}
}

void keyReleased() {
if (key == CODED) {
switch (keyCode) {
case UP:
upPressed = false;
break;
case DOWN:
downPressed = false;
break;
case LEFT:
leftPressed = false;
break;
case RIGHT:
rightPressed = false;
break;
}
}
}


void draw (){
switch (gameState){

case gameStart:
println("gameStart");
treasurePosX=floor(random(width-90))+50;
treasurePosY=floor(random(height-90))+50;

//enemy1PosX=0;
enemy1PosX=(-enemySize)*2;
enemy1PosY=floor(random(height-90))+50;
//enemy1PosY=height/2-enemySize/2;


fighterPosX=floor(random(width-90))+50;
fighterPosY=floor(random(height-90))+50;
hpValue=20;
//start Button
if (mouseX>strtBnLftBrdrX&&mouseX<strtBnRtBrdrX&&mouseY>strtBnUpBrdrY&&mouseY<strtBnLwBrdrY){
image (startImg1, 0, 0);
}
else {
image (startImg2, 0, 0);
}
break;

case gameWin:
println("gameWin");
break;

case gameLose:
// end Button
if (mouseX>endBnLftBrdrX&&mouseX<endBnRtBrdrX&&mouseY>endBnUpBrdrY&&mouseY<endBnLwBrdrY){
image (endImg1, 0, 0);
}
else{
image (endImg2, 0, 0);
}
println("gameLose");
break;

case gameRun:
println("gameRun");
// background run
image (backgroundImg1, bg1PosX++, 0);
image (backgroundImg2, bg2PosX++, 0);
if (bg1PosX>641){bg1PosX=-640;}
if (bg2PosX>641){bg2PosX=-640;}

/*
// figher position = mouse position
if (mouseX>=0 && mouseX<=width){
fighterPosX=mouseX;
}
else if(mouseX<0){
fighterPosX=0;
}
else {
fighterPosX=width;
}
if (mouseY>=0 && mouseY<=height){
fighterPosY=mouseY;
}
else if(mouseY<0){
fighterPosY=0;
}
else{
fighterPosY=height;
}
image(fighterimg, fighterPosX, fighterPosY);
*/

//fighter position controlled by keyboard
if(upPressed==true && fighterPosY-3>0){fighterPosY-=3;}
if(downPressed==true&&fighterPosY+3<height-51){fighterPosY+=3;}
if(leftPressed==true&&fighterPosX-3>0){fighterPosX-=3;}
if(rightPressed==true&&fighterPosX+3<width-51){fighterPosX+=3;}
image(fighterimg, fighterPosX, fighterPosY);
//println("fighterPosX=", fighterPosX);
//println("fighterPosY=", fighterPosY);

// hp
// hp background
stroke(0,0,50);fill(0,0,50);
rect(21, 15, 190, 20); //full hp == 190 point
// hp itself
println("hpValue=", hpValue);
stroke(0,0,200);fill(0,0,200);
if (hpValue<40){stroke(250,20,20);fill(250,20,20);}
if(hpValue>0){
rect(21, 15, hpValue*1.9, 20); //full hp == 190 point
}
image(hpImg,10,10);
//hp value <=0
if (hpValue<=0){
gameState=gameLose;
}

// enemy
//enemy fighter contact
/*
if ((Math.abs(fighterPosX-enemy1PosX)<=fEDis)&&Math.abs(fighterPosY-enemy1PosY)<=fEDis){
enemy1PosX=0;
enemy1PosY=floor(random(height-90))+50;
hpValue-=20;
}
if (enemy1PosX>width){
enemy1PosX=0;
}
if (fighterPosX-enemy1PosX>fEDis){
enemy1PosX+=enemySpeedX;
}
if (enemy1PosX-fighterPosX>fEDis){
enemy1PosX+=enemySpeedX;
}
if (fighterPosY-enemy1PosY>0){
enemy1PosY+=enemySpeedY;
}
if (enemy1PosY-fighterPosY>0){
enemy1PosY-=enemySpeedY;
}
*/

// align enemy
println("i=", i);
switch(gameLevel){
  case '1':
//level 1
if (enemy1PosX<(width+7*(enemySize+10))){
while (i<5){
image (enemyImg, enemy1PosX-i*(enemySize+10), enemy1PosY);
  i++;
}
    println("enemy1PosX=", enemy1PosX);
    println("enemy1PosY=", enemy1PosY);

  enemy1PosX=enemy1PosX+3;
  i=0;
}else{
  //after level 1, go to level 2
gameLevel='2';
enemy1PosX=(-enemySize)*2;
enemy1PosY=floor(random(height-150))+50;
}
  break;
  
  case '2':
  //level 2
  println("gameLevel='2'");

  if (enemy1PosX<(width+7*(enemySize+10))){
while (i<5){
image (enemyImg, enemy1PosX-i*(enemySize+10), enemy1PosY-i*15);
  i++;
}
    println("enemy1PosX=", enemy1PosX);
    println("enemy1PosY=", enemy1PosY);

  enemy1PosX=enemy1PosX+3;
  i=0;
}else{
    //after level 2, go to level 3
gameLevel='3';
enemy1PosX=(-enemySize)*2;
enemy1PosY=floor(random(height-150))+50;
}
  break;
  
  case '3':
  //level 3
    println("gameLevel='3'");

    if (enemy1PosX<(width+7*(enemySize+10))){
image (enemyImg, enemy1PosX-0*(enemySize+10), enemy1PosY-0*40);
image (enemyImg, enemy1PosX-1*(enemySize+10), enemy1PosY-1*40);
image (enemyImg, enemy1PosX-1*(enemySize+10), enemy1PosY+1*40);
image (enemyImg, enemy1PosX-2*(enemySize+10), enemy1PosY-2*40);
image (enemyImg, enemy1PosX-2*(enemySize+10), enemy1PosY+2*40);
image (enemyImg, enemy1PosX-3*(enemySize+10), enemy1PosY-1*40);
image (enemyImg, enemy1PosX-3*(enemySize+10), enemy1PosY+1*40);
image (enemyImg, enemy1PosX-4*(enemySize+10), enemy1PosY-0*40);
    println("enemy1PosX=", enemy1PosX);
    println("enemy1PosY=", enemy1PosY);
  enemy1PosX=enemy1PosX+3;
}else{
    //after level 3, go to level 1
gameLevel='1';
enemy1PosX=(-enemySize)*2;
enemy1PosY=floor(random(height-90))+50;
}
/*
  if (enemy1PosX<(width+7*(enemySize+10))){
while (i<5){
image (enemyImg, enemy1PosX-i*(enemySize+10), enemy1PosY-i*15);
  i++;
}
    println("enemy1PosX=", enemy1PosX);
    println("enemy1PosY=", enemy1PosY);

  enemy1PosX=enemy1PosX+3;
  i=0;
}
*/

  break;
}
  
//image (enemyImg, enemy1PosX, enemy1PosY);


//treasure
//treasurePosX+=treasureSpeedX;
//enemy fighter contact
if ((Math.abs(fighterPosX-treasurePosX)<fTDis)&&Math.abs(fighterPosY-treasurePosY)<fTDis){
treasurePosX=floor(random(width-90))+50;
treasurePosY=floor(random(height-90))+50;
hpValue+=10;
if (hpValue>100){hpValue=100;}
}
image (treasureImg, treasurePosX, treasurePosY);
if (treasurePosX>640){treasurePosX=0;}

break;

}
}
