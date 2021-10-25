class Ship{ //the class of the player's ship
  int x;
  int y;
  int s;
  
  Ship(){ //ship starts in the middle of the screen
    x=250;
    y=10;
    s=3;
  }
  
  void display(){
    fill(0);
    rect(x,y,100,20);
    rect(x,y,10,40);
  }
  
  void move(){ //move the ship using arrow keys
   if(keyPressed==true){
     if(keyCode==RIGHT){
      x=x+s;
    }
    
    if(keyCode==LEFT){
      x=x-s;
    }
   if(x<=50)
   { x=51; }
   if(x>=450)
   { x=449; }
  }
  }
}