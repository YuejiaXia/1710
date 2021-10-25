Blaster[] stun = new Blaster[1000]; //declare a bunch of blaster rays
Invader[][] aliens = new Invader[8][4]; //delcare arrays, objects and booleans
Invader[][] aliens2 = new Invader[8][4];

Ship ship = new Ship(); 

int blastcount;
int score;

PImage clouds;
PImage smoke;
PImage earth;

boolean start = false;
boolean lose = false;

///////////////////////////////////
void setup(){ 
size(500,500);
textAlign(CENTER, CENTER);
rectMode(CENTER);

 
ship = new Ship(); //initialize ship

stun[0] = new Blaster(ship.x); //ONLY INITIALIZE ONE

  for(int i=0; i<8; i++){ //rows
    for(int j=0; j<4; j++){ //columns
       aliens[i][j] = new Invader(i*50+10, j*50+200); //place them at i, j (times 50 to space them)
       aliens2[i][j] = new Invader(i*50+10, j*50+400);
  }
  }
  
blastcount=0; //initialize varibles 
score=0;



}

void draw(){
//start screen
 background(150);


//if s is pressed the game starts 
 if(key==' '){ start=true; }
 if(start==true){


  for(int i=0; i<blastcount+1; i++){ //call methods on the blasters
      stun[i].display();
      stun[i].move();
  }
  
ship.display(); //call methods on the ship
ship.move();

  for(int i=0; i<8; i++){ //call the method on the 2D array in nested for loops
    for(int j=0; j<4; j++){
    
      aliens[i][j].display(); 
      aliens[i][j].move();
      aliens2[i][j].display2();
      aliens2[i][j].move();
      
       for(int k=0; k<blastcount+1; k++){
      if(aliens[i][j].caught(stun[k].x,stun[k].y,1) || aliens2[i][j].caught(stun[k].x,stun[k].y,2)){ //if the stun ray hits an invader they both disapear and the score goes up.
        stun[k].x=2000;
    }
  
  
  if(aliens[i][j].y<=0 || aliens[i][j].intersect(ship.x,ship.y) || aliens2[i][j].y<=0 || aliens2[i][j].intersect(ship.x,ship.y)){lose= true;}
   if(lose == true){ aliens[i][j].lose(); ship.s=0;}
       } 
  
  if(score>=100){aliens[i][j].win();} //win the game
  
    }
  }

 fill(255);
 text("Score: "+score, 90, 450);
 }
 
}


void keyPressed(){
  if(key==' '){ //if the space is pressed
  blastcount++; //increase the ray counter
  stun[blastcount] = new Blaster(ship.x); //initialize the next ray and PASS THE X LOCATION OF THE SHIP IN AS A PARAMETER
}
}
