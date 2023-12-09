//This program is a simulation of pirates on a sea of islands with a navy in the center attempting to stop the pirates. 
//When the pirates come across an island there are many things they can do such as: fight the inhabitants of the island to make it their own, 
//pass through the island if the people are friendly, ransack the island even though the people are friendly, and more. I encourage you to 
//read the code for a full understanding of the possibilities. Additionally, the navy is actively trying to stop the pirates and they are based
//on an island with an established society in the middle of the sea.
//The coloured islands/squares are the pirates and the white island/square is the navy.
import g4p_controls.*;

int numIslands = 25;
int numInitalPirates = 3;
ArrayList<Pirate> pirates = new ArrayList();
ArrayList<Island> islands = new ArrayList();
ArrayList<Navy> navy = new ArrayList();
int newCrewInt = 0;
int newCrewIntBenchmark = int(random(600, 900));
boolean paused = false;

void setup() {
  createGUI();
  size(900, 600);
  
  //Making the initial islands
  //Island(x, y, diameter, strength, health, somethingToFight, inhabited)
  Island navyIsland = new Island(width/2, height/2, 75, 9999, 99999, true, true);
  islands.add(navyIsland);
  islands.get(0).islandColour = color(255);
  
  setIslands();
  
  //Making the initial pirates
  for (int i = 0; i < numInitalPirates; i++){
    int tempInt = int(random(1, numIslands)); 
    islands.get(tempInt).createCrew();
  }
  
  //Making the initial navy
  islands.get(0).createNavyShip();
}


void draw() {
  background(43, 100, 224);
  
  //Drawing my islands
  for (int i = 0; i < islands.size(); i++) {
    if(islands.get(i).inhabited == false) {
     islands.get(i).islandColour = color(0);
     islands.get(i).somethingToFight = false;
    }
    islands.get(i).drawMe(); 
  }
  
      
  //making new pirate crews every 15-20 seconds
  newCrewInt++;
    
  if (newCrewInt > newCrewIntBenchmark) {
    int tempInt = int(random(1, islands.size()));
    islands.get(tempInt).createCrew();
    newCrewIntBenchmark = int(random(600, 900));
    newCrewInt = 0;
  }
  
  //Drawing and updating my pirates
  for (int i = 0; i < pirates.size(); i++) {
   if(pirates.get(i).alive == true) {
     pirates.get(i).drawMe(); 
     pirates.get(i).updateMe();
   }
  }
  
  //Drawing and updating my navy
  for (int i = 0; i < navy.size(); i++) {
   if(navy.get(i).alive == true) {
     navy.get(i).drawMe(); 
     navy.get(i).updateMe();
   }
  }
  
  //Seeing if any pirates are on/fighting an island
  for (int i = 0; i < pirates.size(); i++) {
    for (int l = 0; l < islands.size(); l++) {
     if(dist(pirates.get(i).position.x, pirates.get(i).position.y, islands.get(l).position.x, islands.get(l).position.y) < islands.get(l).diameter/2)
       pirates.get(i).fightIsland(islands.get(l));
    }  
  }
  
  //Seeing if any navy ships on an island
  for (int i = 0; i < navy.size(); i++) {
    for (int l = 0; l < islands.size(); l++) {
     if(dist(navy.get(i).position.x, navy.get(i).position.y, islands.get(l).position.x, islands.get(l).position.y) < islands.get(l).diameter/2)
       navy.get(i).contactIsland(islands.get(l));
    }  
  }
  
  //Seeing if any navy ships are close to a pirate
  for (int i = 0; i < navy.size(); i++) {
    for (int l = 0; l < pirates.size(); l++) {
     if(dist(navy.get(i).position.x, navy.get(i).position.y, pirates.get(l).position.x, pirates.get(l).position.y) < 50)
       navy.get(i).fightPirate(pirates.get(l));
    }  
  }
  
}
