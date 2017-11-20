var backimg;
var doll1,doll2;
var airship;
var robot;
var mask;
var alpha;
var alphaspeed;
var airshippostionx=0;
var airshippositiony=10;
var theFont;

function preload() {
  backimg = loadImage("data/bg.jpg");
  doll1=loadImage("data/doll1.png");
  doll2=loadImage("data/doll2.png");
  airship=loadImage("data/airship.png");
  robot=loadImage("data/robot.png");
  mask=loadImage("data/mask.png");
  theFont=loadFont("data/font1.ttf");

}
function setup() {
	createCanvas(1200,800);
	alpha=200;
	alphaspeed=1;

}

function draw(){
	
	image(backimg,0,0);

	push();
	rotate(-PI/15);
	tint(255,alpha);
	image(doll1,500,200);
	alpha-=alphaspeed;
	if(alpha<0||alpha>200){
		alphaspeed*=-1;
	}
	noTint();
	tint(255,200-alpha)
	image(doll2,500,200);
	noTint();
    pop();
    //robot
    image(robot,0,420);
    image(mask,0,420);

	image(airship,airshippostionx,airshippositiony);
	airshippostionx+=1;
	if(airshippostionx>width){
		airshippostionx=0;
	}

	textFont(theFont,20);
	text("Crborg Surgery 50OFF",airshippostionx+200,airshippositiony+80);
	filter(POSTERIZE,5);
	//filter(BLUR,1);
}

