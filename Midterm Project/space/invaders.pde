class Invader{ //class of invaders
  float x;
  float y;
  
int t;
int t2;
float s;

PImage carbon;
PImage carbon2;

  Invader(float tempx, float tempy){
    x=tempx;
    y=tempy;
    t=0;
    t2=0;
    s=6;
    carbon = loadImage("carbon.png");
    carbon2 = loadImage("carbon2.png");
 
  }
  
  void display(){
    fill(0);
    image(carbon, x, y);
}

void display2(){
  //image(carbon2,x,y);
}
  
  void move(){ //make the invaders move
//counters to count when the invaders to horizontaly and then verticaly down once it has moved horizontaly a certain amount
    t=t+1; 
    if(t==10){
      x=x+s;
    t=0;
    t2=t2+1;
    }
    
    if(t2==15){
      y=y-6;
      t2=0;
      s=-s;
    }
 
  }
  
  boolean caught(float tempX,float tempY, int points){
     if(tempX>x-2.5 && tempX<x+42.5 && tempY>y-2.5 && tempY < y+42.5){ //if the invader and the blaster intersect
     x=5000;
     score=score+points;
   return true;
  }
   return false;
}

boolean intersect(float tx, float ty){  //take temp variables for the ship position
    if(tx>x-50 && tx<x+90 && ty>y-10 && ty < y+40){
      return true;
    }
    return false;
  }

void lose(){ //lose screan
  x=10000;
  
  fill(255,0,0);
  rect(250,250,500,500);
  
  fill(0);
  textSize(15);
  
  text("It's pity!", 250,240);
  text("Score: "+score, 250, 260);
  
}

void win(){ //win screen
  fill(0,255,0);
  rect(250,250,500,500);
  
  fill(0);
  textSize(15);
  text("Congratulations!", 250,230);

  text("Score: "+score, 250, 270);
}
}
