class Particles{
  int[][] particlePositions;
  int[] particleColors;
  
  Particles(int particleSpacing){
    int rows= (int) height/particleSpacing;
    int columns= (int) width/particleSpacing;
    particlePositions= new int[rows * columns][2];
    particleColors= new int[rows * columns];
    
    for( int i=0; i < rows; i++ ){
      for( int j=0; j < columns; j++){
        particlePositions[ i * columns + j ][0]= j * particleSpacing;
        particlePositions[ i * columns + j ][1]= i * particleSpacing; 
        particleColors[ i * columns + j ]= 255;
      }
    }
  }
  
  void drawParticles(){
    background(0);
    for( int i=0; i< this.particlePositions.length; i++){
      fill(this.particleColors[i]);
      ellipse(this.particlePositions[i][0], this.particlePositions[i][1], 2,2);
    }
  }
  
  void stepParticles( FlowField flowField){
   
   
  }
  
}