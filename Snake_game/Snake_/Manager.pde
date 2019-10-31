

Snake s ;
food f;

void settings() {

  size(500, 500);
}

void setup() {

  frameRate(15);
  s = new Snake();
  f= new food();

  f.foodPosition();
}


void draw() {

  background(0);

  f.makeFood();
  s.grid();
  s.move();
  s.snake();
  lose();
  eatFood();
  wallPass();
}

void eatFood(){
  
   if (f.xtail ==s.x &&  f.ytail == s.y) {
    s.total++;
    f.foodPosition();
  }  
}


//check is head collide with tail 
void lose() {

  for (PVector p : s.tail) {

    if (dist(s.x, s.y, p.x, p.y)==0) {    
      s.tail.clear();      
      s.total=0;      
      return;
    }    
  }
}


//make snake pass thround walls
void wallPass() {

  if (s.x == width) {  
    s.x = -20;
  } else if (s.x == -20) {  
    s.x = width;
  } else if (s.y == height) {  
    s.y = -20;
  } else if (s.y == -20) {  
    s.y = height;
  }
}

//create food 
class food {

  float x = floor(width / 20);
  float y = floor(height / 20);

  float xtail;
  float ytail;

  void makeFood() {

    fill(255, 0, 0);
    rect(xtail, ytail, 20, 20);
  }

  //random food Position
  void foodPosition() {

    xtail =floor(random(x))*20;
    ytail =floor(random(y))*20;
  }
}
