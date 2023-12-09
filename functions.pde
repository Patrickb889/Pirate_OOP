void setIslands() {
  for (int i = 0; i < numIslands; i++) {
    float tempFloat = random(0, 10);
    boolean b;
    float tempX;
    float tempY;
    boolean xClear = false;
    boolean yClear = false;
    boolean tempxClear = false;
    boolean tempyClear = false;
    
    if (tempFloat > 2)
      b = true;
    else
      b = false;
    
    tempX = random(15, width-15);
    tempY = random(15, height-15);
    
    while(xClear == false) {
      tempX = random(15, width-15);
      for(int l = 0; l < islands.size(); l++) {
        float k = islands.get(l).position.x;
       if(k-20 <= tempX && tempX <= k+20) { 
         xClear = false;
         break;
      }
       else
         tempxClear = true;
     }   
     if(tempxClear == true)
       xClear = true;
    }
    
    while(yClear == false) {
      tempY = random(15, height-15);
      for(int l = 0; l < islands.size(); l++) {
        float k = islands.get(l).position.y;
       if(k-20 <= tempY && tempY <= k+20) { 
         yClear = false;
         break;
      }
       else
         tempyClear = true;
     }   
     if(tempyClear == true)
       yClear = true;
    }
    
    islands.add(new Island(tempX, tempY, random(20, 30), random(0, 90), random(100, 500), b, true));
  }
}
