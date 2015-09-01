class Particles{
  Particle[] particles;
  
  Particles(int particleSpacing){
    int rows= (int) height/particleSpacing;
    int columns= (int) width/particleSpacing;
    particles= new Particle[rows * columns];
    
    for( int i=0; i < rows; i++ ){
      for( int j=0; j < columns; j++){
        float initX= (float) j * particleSpacing;
        float initY= (float) i * particleSpacing;
        color initC= #C290D4;
        
        particles[ i * columns + j]= new Particle(initX,initY,initC);
       
      }
    }
  }
  
  void drawParticles(){
    background(0);
    for( Particle p: this.particles){
      stroke(p.c);
      fill(p.c);
      ellipse(p.x, p.y, 2,2);
    }
  }
  
  void stepParticles( FlowField flowField){
    int xStep= flowField.vectorOrigins[1][0] - flowField.vectorOrigins[0][0];  // Assumes uniform x distribution of flow Vectors
    int yStep= flowField.vectorOrigins[flowField.columns][1] - flowField.vectorOrigins[0][1];  // Assumes uniform y distribution of flow Vectors
    
    for( Particle p: this.particles){
      int c = (int) p.x / xStep; // column of nearest vector in flow field
      int r = (int) p.y / yStep; // row of nearest vector in flow field
      
      int cOffset= 0; // correction if closer to next column vector
      int rOffset= 0; // correction if closer to next row vector
      
      if( p.x > ( c * xStep + xStep/2 ) ){ cOffset = 1; }
      if( p.y > ( r * yStep + yStep/2 ) ){ rOffset = 1; }
      
      int nearestVector= (r + rOffset) * flowField.columns + c + cOffset;
      
      print(flowField.vectorOrigins[1][1]);
      print("\n");
      print(r);
      print("\n");
      print("columns");
      print(flowField.columns);
      print("\n");
      print("nearest vector");
      print(nearestVector);
      print("\n");
      print("number of flow vectors");
      print(flowField.flowVectors.length);
      print("\n");
      
      p.x= p.x + flowField.flowVectors[ nearestVector].x/ frameRate;
      p.y= p.y + flowField.flowVectors[ nearestVector].y/ frameRate;
    }
   
  }
  
}

class Particle{
  float x;
  float y;
  color c;
  
  Particle( float initX, float initY, color initC){
    x= initX;
    y= initY;
    c= initC;
  }
  
}