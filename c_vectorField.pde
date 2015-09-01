class FlowField {
  PVector [] flowVectors;
  PVector initialVector;
  int rows;
  int columns;
  int [][]  vectorOrigins;
   
  FlowField( PVector initVec, int initRows, int initColumns ){
    set( initVec, initRows, initColumns);
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
  
  void updateFlowVector( int i, float newX, float newY){
    this.flowVectors[i]= new PVector(newX,newY); 
  }
  
  void updateField(){
    for(int i=0; i<this.flowVectors.length; i++){
      PVector vOrigin= new PVector(this.vectorOrigins[i][0], this.vectorOrigins[i][1]);
      PVector vMouse= new PVector(mouseX, mouseY);
      PVector vMove= PVector.sub(vMouse, vOrigin);
      float moveSpeed= 10.0;
      
      if(vMove.mag() > 1){
        updateFlowVector(i, this.flowVectors[i].x + moveSpeed*vMove.x/vMove.magSq(), this.flowVectors[i].y - moveSpeed*vMove.y/vMove.magSq()); 
      } else if( vMove.mag() != 0){
        vMove.normalize();
        updateFlowVector(i, this.flowVectors[i].x + moveSpeed*vMove.x/vMove.magSq(), this.flowVectors[i].y - moveSpeed*vMove.y/vMove.magSq()); 
      }
    }
  }
  
  void swirrleField(){
    for( int i=0; i < this.vectorOrigins.length; i++){
      PVector v= this.flowVectors[i];

      if( this.vectorOrigins[i][0] > width/2){
        this.updateFlowVector(i, v.x,-v.y);
      } 
      v= this.flowVectors[i];
      if( this.vectorOrigins[i][1] > height/2){
        this.updateFlowVector(i, -v.x,v.y);
      }
    }
  }
  
  void set( PVector initVec, int initRows, int initColumns ){
    rows= initRows;
    columns= initColumns;
    initialVector= initVec;
    flowVectors = new PVector[rows * columns];
    vectorOrigins = new int[rows * columns][2];
    
    int rowStep= height/(rows - 1);
    int columnStep= width/(columns - 1);

    for(int i = 0; i < rows; i++){
      for(int j = 0;j < columns; j++){
        flowVectors[i*columns + j]= initVec;
        vectorOrigins[i*columns+j][0]=  j * columnStep; // x coordinate
        vectorOrigins[i*columns+j][1]=  i * rowStep; // y coordinate        
      }
    }
  }
  
  void reset(){
    set( this.initialVector, this.rows, this.columns);
    swirrleField();
  }
  
}