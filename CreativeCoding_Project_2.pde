//It is a cyberpunk style collage.
//The code of "text mask" refers to GENERATIVE DESIGN P_4_3_2_01.
//image & font
PImage backimg;
PImage doll1,doll2;
PImage airship;
PFont airshipFont;
PImage robot;
PImage mask;
PFont maskFont;
//doll variables
float alpha=200;
float alphaSpeed=20;
//airship variables
float airshipPosX=0;
float airshipPosY=10;
//mask variables
String inputText = "Cyborg";
float fontSizeMax = 10;
float fontSizeMin = 5;
float spacing = 5; 
float kerning = 0.5; 
//laser eye
 float eyeX=138;
 float eyeY=263;
void setup(){
  size(600,400);
  smooth();
  //load images
  backimg = loadImage("data/bg.jpg");
  doll1=loadImage("data/doll1.png");
  doll2=loadImage("data/doll2.png");
  airship=loadImage("data/airship.png");
  airshipFont=createFont("data/font1.ttf",20);
  robot=loadImage("data/robot.png");
  mask=loadImage("data/mask.png");
  maskFont=createFont("Times",10);
}

void draw(){
  //bk
  background(255);
  image(backimg,0,0);
  
  //dolls projection
  pushMatrix();
  translate(200,50);
  rotate(-PI/8);
  for(int y=0;y<doll1.height;y++){
    for(int x=0;x<doll1.width;x+=4){
      color c1=doll1.get(x,y);
      strokeWeight(2);
      stroke(c1,alpha);
      line(x,y,x,y+1);
    }
  }
  for(int j=0;j<doll2.height;j++){
    for(int i=0;i<doll2.width;i+=4){
      color c2=doll2.get(i,j);
      strokeWeight(2);
      stroke(c2,200-alpha);
      line(i,j,i,j+1);
    }
  }
  popMatrix();
  alpha-=alphaSpeed;
   if(alpha<0||alpha>200){
     alphaSpeed*=-1;
   }
   
   //airship&text
   image(airship,airshipPosX,airshipPosY);
   airshipPosX+=1;
  if(airshipPosX>width){
    airshipPosX=0;
  }
  fill(random(255),random(255),random(255));
  textFont(airshipFont,15);
  text("Crborg Surgery 50 OFF",airshipPosX+65,airshipPosY+40);
  
  
  //robot
  image(robot,0,210);
  fill(255,0,0,100);
 //lasereye
  float theta=PI/6;
  float vx=cos(theta)*10;
  float vy=sin(theta)*10;
  ellipse(138,263,8,8);
  eyeX+=vx;
  eyeY+=vy;
  stroke(255,0,0);
  strokeWeight(2);
  line(138,263,eyeX,eyeY);
  if(eyeY>height){
    eyeX=138;
    eyeY=263;
  }
  //mask
  textAlign(LEFT);
  float m = 0, n = 10;
  int counter = 0;
  pushMatrix();
  translate(0,210);
  while (n < 197) {
    int maskX = (int) map(m, 0,200, 0,mask.width);
    int maskY = (int) map(n, 0,197, 0,mask.height);
    color c3 = mask.pixels[maskY*mask.width+maskX];
    int greyscale = round(red(c3)*0.222 + green(c3)*0.707 + blue(c3)*0.071);

    pushMatrix();
    translate(m,n);
    float fontSize = map(greyscale, 0,255, fontSizeMax,fontSizeMin);
    fontSize = max(fontSize, 1);
    textFont(maskFont, fontSize);
    fill(c3);
    char letter = inputText.charAt(counter);
    text(letter, 0, 0);
    float letterWidth = textWidth(letter) + kerning;
    m = m + letterWidth; 
    popMatrix();

    // break lines
    if (m+letterWidth >= 200) {
      m = 0;
      n = n + spacing;
    }

    counter++;
    if (counter > inputText.length()-1) counter = 0;
  }
  popMatrix();
  filter(POSTERIZE,5);

}