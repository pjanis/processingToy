
int rows= 25;
int columns= 45;
int background_color= 255;
PVector initialVector= new PVector(5,5);

void setup(){
  background(background_color);
  size(900, 500);  
  
  FlowField flowField= new FlowField(initialVector, rows, columns);
  flowField.drawField();
  
  DisplayControls displayControls= new DisplayControls();
  displayControls.drawControls();
}

void draw(){
  
}