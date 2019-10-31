
class Snake {

  float x = (width/2)+10;
  float y = (height/2)+10;
  float xSpeed = 1;
  float ySpeed = 0;

  ArrayList<PVector> tail = new ArrayList<PVector>();
  
  int total=0;

  void grid() {

    stroke(100); 
    noFill();

    for (int i=0; i<width; i++) { 
      for (int j=0; j<height; j+=20) {

        line(i, j, i, j);
        line(j, i, j, i);
      }
    }
  }
  
  //make snake
  void snake() {
    
    fill(0, 255, 0);
    rect(x, y, 20, 20);
    
    //display tail
    for (int i=0; i<tail.size(); i++) {
      rect(tail.get(i).x, tail.get(i).y, 20, 20);
    }
    
  }


  // snake movement
  void move() {

    // add new position in tail and check for total food eat and removes last 0th position from tail
    tail.add(new PVector(x, y));      
    if (tail.size() > total) {  

      tail.remove(0);
    } 

    x += xSpeed * 20;
    y += ySpeed * 20;

    if (keyPressed) {
      keyPress();
    }
  }


  //movement keys
  void keyPress() {

    if (key == CODED) {
      if (keyCode == DOWN && ySpeed != -1) { 
        xSpeed = 0;
        ySpeed = 1;
      } 
      else if (keyCode == UP && ySpeed != 1) {      
        xSpeed = 0;
        ySpeed = -1;
      } 
      else if (keyCode == RIGHT && xSpeed != -1) {      
        xSpeed = 1;
        ySpeed = 0;
      } 
      else if (keyCode == LEFT && xSpeed != 1) {      
        xSpeed = -1;
        ySpeed = 0;
      }     
    }
  }
}
