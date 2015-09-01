class Particles{
  Particle[] particles;
  int initialSpacing;
  
  Particles(int particleSpacing){
    set( particleSpacing);
  }
  
  void drawParticles(){
    background(0);
    for( Particle p: this.particles){
      stroke(red(p.c), green(p.c), blue(p.c), alpha(p.c)/2);
      fill(p.c);
      ellipse(p.x, p.y, 10,10);
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
      
      p.x= p.x + 5 * flowField.flowVectors[ nearestVector].x/ frameRate;
      p.y= p.y - 5 * flowField.flowVectors[ nearestVector].y/ frameRate; //minux because y in processing increases going down
      
      if( p.x < 0){ p.x = 0;}
      if( p.y < 0){ p.y = 0;}
      if( p.x > width){ p.x = width;}
      if( p.y > height){ p.y = height;}
    }
   
  }
  
  void set(int particleSpacing){
    initialSpacing= particleSpacing;
    int rows= (int) height/particleSpacing;
    int columns= (int) width/particleSpacing;
    particles= new Particle[rows * columns];
    
    for( int i=0; i < rows; i++ ){
      for( int j=0; j < columns; j++){
        float initX= (float) j * particleSpacing;
        float initY= (float) i * particleSpacing;
        color initC= color(30,40,255,100);
        
        particles[ i * columns + j]= new Particle(initX,initY,initC);
       
      }
    }
  }
  
  void reset(){
    set( this.initialSpacing);
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