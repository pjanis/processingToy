class DisplayControls{
  String[] states;
  int state_index;
  
  DisplayControls(){
    states= new String[] { "vectors", "particals" };
    state_index= 0;
    
  }
  
  void drawControls(){
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
    rect( width - control_box_width, -1, control_box_width, control_box_height );
    
    fill(255);
    textAlign( CENTER, CENTER );
    text( this.states[this.state_index], width - control_box_width, -1, control_box_width, control_box_height );
    
  }
  
  
  // only changes parameters. doesn't update display
  void cycleControl(){
    this.state_index= (this.state_index + 1) % this.states.length;
  }
}