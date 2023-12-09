class Pirate {
 //FIELDS
 Float strength, health, brutality, speed, angle;
 boolean alive;
 color crewColour;
 ArrayList<Island> islands = new ArrayList();
 PVector position, direction, velocity;
 
 //CONSTRUCTOR
 Pirate(float x, float y, Float str, Float h, Float b, Float spe, color col) {
  this.position = new PVector(x, y);
  this.strength = str;
  this.health = h;
  this.brutality = b;
  this.speed = spe;
  this.alive = true;
  this.crewColour = col;
  this.angle = random(0, 2*PI);
 }
 
 //METHODS
 void drawMe() {
  fill(this.crewColour);
  square(this.position.x+5, this.position.y+5, 10);
 } 
 
 void updateMe() {
  //updating the position of the pirate
  setAngle(); 
  this.position.add(this.velocity);
  
  //Ensuring the pirate is on screen
  if (this.position.x < 15) {
    this.position.x = 15;
    this.angle = random(0, 2*PI);
  }
  if (this.position.x > width-15) {
    this.position.x = width-15;
    this.angle = random(0, 2*PI);
  }
  if (this.position.y < 15) {
    this.position.y = 15;
    this.angle = random(0, 2*PI);
  }
  if (this.position.y > height-15) {
    this.position.y = height-15;
    this.angle = random(0, 2*PI);
  }
 }
 
 void setAngle() {
   this.direction = new PVector(cos(angle), sin(angle));
   this.velocity = this.direction.mult(speed);
 }
 
 void fightIsland(Island i) {
   //what happens if the island is in the pirates control
   if (this.islands.contains(i)) {
    this.health += 100;
   }
   
  //what happens if the pirate will fight the island regularly
  else if(i.somethingToFight == true) {
    //Island and pirates fighting equally
    float originalIslandHealth = i.health;
    float originalPirateHealth = this.health;
    while(this.health > 0 && i.health > 0) {
     i.health -= this.strength; 
     this.health -= i.strength;
    }
    
    //Consequences for a pirate winning the fight
    if(i.health <= 0) {
     if (i.currentOwner != null)
       i.currentOwner.islands.remove(i);
     i.currentOwner = this;
     i.islandColour = this.crewColour;
     i.health += originalIslandHealth;
     
     this.islands.add(i);
     this.health += originalPirateHealth;
     this.angle = random(0, 2*PI);
     this.strength += random(15, 30);
    }
    
    //Consequences for the island winning the fight
    else if(this.health <= 0) {
     i.health += originalIslandHealth/2;
     i.strength += random(10, 20);
     
     this.alive = false;
     for(int l = 0; l < this.islands.size(); l++) {
      this.islands.get(l).islandColour = color(219, 190, 110);
     }
    }
  }
  
  //Sending the pirates away if the island has already been ransacked
  else if(i.inhabited == false) {
   this.health--;
  }
  
  else if(this.brutality > i.diameter) {
    //Pirates ransacking the island  
    this.strength += 35;
    i.inhabited = false;
  }
  
  else {
    //Nothing happens  
    this.health += 50;
  }
 }
 
}
