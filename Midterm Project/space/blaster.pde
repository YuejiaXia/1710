class Blaster{ //class of blasters or stun rays
  float x;
  float y;
  int s;

  
  Blaster(float tempx){ //take in a passed parameter from the ship
    x= tempx; //the ray will start at the same location as the ship
    y=0; //starting location
    s=2;
  }
  
  void display(){
  noStroke();
    fill(0,255,0);
    rect(x, y, 5, 5); 
  }
  
  void move(){

      y=y+s; //move the ray down
  
  }
  
  void keyPressed(){
  if(key==' '){ //if the space is pressed
  blastcount++; //increase the ray counter
  stun[blastcount] = new Blaster(ship.x); //initialize the next ray
}
}
}