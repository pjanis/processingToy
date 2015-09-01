class DisplayControls{
  String[] states;
  int state_index;
  int control_box_x;  // smallest x of control box
  int control_box_y;  // largest y of control box
  int control_box_item_height; //height of each control box item
  
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
    control_box_item_height= control_box_height;

    
    
    // Vector/Particle toggle
    fill(0);
    stroke(255);
    control_box_x= width - control_box_width;
    control_box_y= control_box_height - 1;
    rect( control_box_x, -1, control_box_width, control_box_height );
    
    fill(255);
    textAlign( CENTER, CENTER );
    text( this.states[this.state_index], width - control_box_width, -1, control_box_width, control_box_height );
    
    // Reset Button
    fill(0);
    stroke(255);
    rect( control_box_x, control_box_y, control_box_width, control_box_height );
    
    fill(255);
    textAlign( CENTER, CENTER );
    text( "Reset", control_box_x, control_box_y, control_box_width, control_box_height );
    control_box_y= control_box_y + control_box_height;
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
  
  void updateControl(FlowField flowField, Particles particles){
    if( overControl() ){
      switch(floor(mouseY/control_box_item_height) ){
        case 0:
          this.cycleControl();
          break;
        case 1:
          if(this.states[displayControls.state_index] == "particals"){
            particles.reset();
          } else if(this.states[displayControls.state_index] == "vectors"){
            flowField.reset();
          }
          break;
          
      }
    }
  }
}