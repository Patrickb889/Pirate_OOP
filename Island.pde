class Island {
 //FIELDS
 float strength, health, diameter;
 boolean somethingToFight, inhabited;
 color islandColour;
 Pirate currentOwner;
 PVector position;
 
 //CONSTRUCTOR
 Island(float x, float y, float d, float str, float h, boolean stf, boolean i) {
  this.position = new PVector(x, y);
  this.diameter = d;
  this.strength = str; 
  this.health = h;
  this.somethingToFight = stf;
  this.inhabited = i;
  this.islandColour = color(219, 190, 110);
 }
 
 //METHODS
 void createCrew() {
  //making a new pirate to spawn in on this island
  //Pirate(x, y, strength, health, brutality, speed, colour)
  Pirate p = new Pirate(this.position.x, this.position.y, random(10, 100), random(100, 500), random(-25, 50), random(2, 5), color(random(0, 255), random(0, 255), random(0, 255)));
  pirates.add(p);
  
  //altering values now that the new pirate crew has been made
  p.islands.add(this);
  this.currentOwner = p;
  this.islandColour = p.crewColour;
 }
 
 void createNavyShip() {
  //making navy ships spawn in. Will only be used on the center navy island
  //Navy(strength, health, speed)
  navy.add(new Navy(random(30, 70), random(200, 400), random(3, 4)));
 }
 
 void drawMe() {
   if(this.inhabited == true)
     fill(this.islandColour);
    else if(this.inhabited == false)
      fill(0);
   circle(this.position.x, this.position.y, this.diameter);
 }
  
}
