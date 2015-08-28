class FlowField {
  PVector [][] flowVectors;
   
  FlowField( PVector initialVec, int rows, int columns ){
    flowVectors = new PVector[rows][columns];
    for(int i = 0; i < rows; i++){
      for(int j = 0;j < columns; j++){
        flowVectors[i][j]= initialVec;
      }
    }
  }
  
  void fieldArrow(int start_x, int start_y, int x, int y ){
    int end_x= start_x + x;
    int end_y= start_y - y;
    
    stroke(0);
    strokeWeight(3);
    line(start_x, start_y, end_x, end_y); 
    
    // arrow
    stroke(98, 255, 46);
    int back_x= (int) (start_x + 0.8 * x);
    int back_y= (int) (start_y - 0.8 * y);
    line( end_x, end_y, back_x, back_y );
    
    strokeWeight(1);
  }
  
  
  void drawField(){
    int fieldRows= this.flowVectors.length;
    int fieldColumns= this.flowVectors[0].length;

    int row_step= height/fieldRows;
    int column_step= width/fieldColumns;
    
    for(int i = 0; i < fieldRows; i++){
      for(int j = 0; j < fieldColumns; j++){
        int start_x= j * column_step;
        int start_y= i * row_step;
        int vec_x= (int) this.flowVectors[i][j].x;
        int vec_y= (int) this.flowVectors[i][j].y;
        fieldArrow( start_x, start_y, vec_x, vec_y);    
      }
    }
  }
}