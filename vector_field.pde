
int rows;
int columns;
int background_color= 255;
PVector initialVector= new PVector(5,5);
DisplayControls displayControls;
FlowField flowField;
Particles particles;

void setup(){
  background(background_color);
  size(900, 500);  
  
  rows= 500/50;
  columns= 900/50;
  flowField= new FlowField(initialVector, rows, columns);
  flowField.drawField();
  
  displayControls= new DisplayControls();
  displayControls.drawControl();
  
  particles= new Particles(10); //particle spacing as parameter
}

void draw(){

}

void mousePressed(){
  displayControls.updateControl();
  updateDisplay();
  displayControls.drawControl();
}


void updateDisplay(){
  if( displayControls.states[displayControls.state_index] == "particals" ){
    particles.drawParticles();
  } else if ( displayControls.states[displayControls.state_index] == "vectors" ){
    flowField.drawField();
  }
}