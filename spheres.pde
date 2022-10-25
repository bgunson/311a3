

class Orbital {
  float posX, posY;
  float radiusX, radiusY;
  float theta;
  float rad;
  float maxSize;
  float dRad;
  float dTheta;
  
  Orbital(float size) {
    maxSize = size;
    posX = posY = 0;

    rad = maxSize;
    dRad = random(0.01, 0.25);
    
    radiusX = random((width/2) - (2*maxSize));
    radiusY = random((height/2) - (2*maxSize));
    
    theta = random(360);
    dTheta = random(0.01, 0.025);
  }
  
  void draw() {
    theta += dTheta;
    posX = radiusX * cos(theta);
    posY = radiusY * sin(theta);
    translate(posX, posY);
    rad += dRad;

    if (rad <= 0 || rad > maxSize) {
      dRad *= -1;
    }
    
    sphere(rad);

  }
  
}

ArrayList<Orbital> orbitals;

void setup() {
  size(640, 480, P3D);
  noStroke();
  fill(204);
  
  orbitals = new ArrayList<Orbital>();
  int numO = (int)random(3, 15);
  for (int i = 0; i < numO; i++) {
    orbitals.add(new Orbital(random(20, 100)));
  }
}

void draw() { 
  delay(10);  // helps lower cpu load
  background(255);
  translate(width / 2, height / 2); 
  pointLight(204, 204, 204, 0, 0, 0);
  pointLight(100, 100, 100, width/2, height/2, 100);

  for (Orbital o : orbitals) {
    o.draw();
  }

}
