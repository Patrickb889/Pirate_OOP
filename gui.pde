/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:682050:
  appc.background(230);
} //_CODE_:window1:682050:

public void pauseButtonClicked(GButton source, GEvent event) { //_CODE_:pauseButton:341092:
  if(paused == false) {
   noLoop(); 
   paused = true;
   pauseButton.setText("Play");
  }
  
  else {
   loop(); 
   paused = false;
   pauseButton.setText("Pause");
  }
} //_CODE_:pauseButton:341092:

public void resetButtonClicked(GButton source, GEvent event) { //_CODE_:resetButton:888631:
  islands.removeAll(islands); 
  pirates.removeAll(pirates);
  navy.removeAll(navy);
  setup();
} //_CODE_:resetButton:888631:

public void pirateButtonClicked(GButton source, GEvent event) { //_CODE_:pirateButton:579599:
  newCrewInt = newCrewIntBenchmark;
} //_CODE_:pirateButton:579599:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 240, 120, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  pauseButton = new GButton(window1, 30, 45, 80, 30);
  pauseButton.setText("Pause");
  pauseButton.addEventHandler(this, "pauseButtonClicked");
  resetButton = new GButton(window1, 130, 45, 80, 30);
  resetButton.setText("Reset");
  resetButton.addEventHandler(this, "resetButtonClicked");
  pirateButton = new GButton(window1, 79, 79, 80, 30);
  pirateButton.setText("Add Pirate");
  pirateButton.addEventHandler(this, "pirateButtonClicked");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton pauseButton; 
GButton resetButton; 
GButton pirateButton; 
