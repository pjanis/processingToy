class DisplayControls{
  String[] states;
  int state_index;
  int control_box_x;  // smallest x of control box
  int control_box_y;  // largest y of control box
  
  DisplayControls(){
    states= new String[] { "vectors", "particals" };
    state_index= 0;
    
  }
  
  void drawControl(){
    int control_box_width= 0;
    int control_box_height= (int) (textAscent() + textDescent());
    
    for( String s: states ){
      if(textWidth(s) > control_box_width){
        control_box_width= (int) textWidth(s);
      }
    }
    
    control_box_width= control_box_width + 2 * 5;  //add padding
    control_box_height= control_box_height + 2 * 5;
    
    fill(0);
    stroke(255);
    control_box_x= width - control_box_width;
    control_box_y= control_box_height - 1;
    rect( control_box_x, -1, control_box_width, control_box_height );
    
    fill(255);
    textAlign( CENTER, CENTER );
    text( this.states[this.state_index], width - control_box_width, -1, control_box_width, control_box_height );
    
  }
  
  
  // only changes parameters. doesn't update display
  void cycleControl(){
    this.state_index= (this.state_index + 1) % this.states.length;
  }
  
  boolean overControl(){
    if( mouseX > control_box_x && mouseY < control_box_y ){
      return true;
    } else {
      return false; 
    }
  }
  
  void updateControl(){
    if( overControl() ){
      this.cycleControl();
    }
  }
}