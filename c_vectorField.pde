class FlowField {
  PVector [] flowVectors;
  int [][]  vectorOrigins;
   
  FlowField( PVector initialVec, int rows, int columns ){
    flowVectors = new PVector[rows * columns];
    vectorOrigins = new int[rows * columns][2];
    
    int row_step= height/rows;
    int column_step= width/columns;
    
    for(int i = 0; i < rows; i++){
      for(int j = 0;j < columns; j++){
        flowVectors[i*columns + j]= initialVec;
        vectorOrigins[i*columns+j][0]=  j * column_step; // x coordinate
        vectorOrigins[i*columns+j][1]=  i * row_step; // y coordinate        
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
    
    background(255);
    
    for(int i = 0; i < this.flowVectors.length; i++){
      int vec_x= (int) this.flowVectors[i].x;
      int vec_y= (int) this.flowVectors[i].y;
      fieldArrow( this.vectorOrigins[i][0], this.vectorOrigins[i][1], vec_x, vec_y);    
    }
  }
}