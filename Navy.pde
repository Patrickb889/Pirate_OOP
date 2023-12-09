class Navy {
 //FIELDS
 Float strength, health, speed, angle;
 boolean alive;
 PVector position, direction, velocity;
 
 //CONSTRUCTOR
 Navy(float str, float h, float spe) {
  this.strength = str;
  this.health = h;
  this.speed = spe;
  this.alive = true;
  this.position = new PVector(width/2, height/2);
  this.angle = random(0, 2*PI);
 }
 
 //METHODS
 void drawMe() {
  fill(255);
  square(this.position.x+7.5, this.position.y+7.5, 15);   
 }
 
 void updateMe() {
  //updating the position of the navy. same code as pirate
  setAngle(); 
  this.position.add(this.velocity);
  
  //Ensuring the navy member is on screen
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
 
 void contactIsland(Island i) {
  if(i.strength < 900){
   if (i.currentOwner != null) 
      i.currentOwner.islands.remove(i);
    i.currentOwner = null;
    i.islandColour = color(219, 190, 110);
  }
 }
 
 void shipKilled() {
  this.alive = false;
  navy.remove(this);
  islands.get(0).createNavyShip(); 
 }
   
 
 void fightPirate(Pirate p) {
  //navy fighting the pirates
  float originalPirateHealth = p.health;
  float originalNavyHealth = this.health;
  while(this.health > 0 && p.health > 0) {
   p.health -= this.strength; 
   this.health -= p.strength;
  }
  
  //Consequences for a pirate winning the fight
  if(this.health <= 0) {
   this.shipKilled();
   
   p.health += originalPirateHealth*2/3;
   p.angle = random(0, 2*PI);
   p.strength += random(15, 30);
  }
  
  //Consequences for the navy winning the fight
  else if(p.health <= 0) {
   this.health += originalNavyHealth;
   this.strength += random(15, 20);
   
   for(int l = 0; l < p.islands.size(); l++) {
    p.islands.get(l).islandColour = color(219, 190, 110);
   }
   pirates.remove(p);
  }
 }
  
}
