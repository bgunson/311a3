

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
    dRad = -1;
    
    radiusX = random((width/2) - (2*maxSize));
    radiusY = random((height/2) - (2*maxSize));
    
    theta = random(360);
    dTheta = 0.01 + random(0.03);
  }
  
  void draw() {
    theta += dTheta;
    posX = radiusX * cos(theta);
    posY = radiusY * sin(theta);
    translate(posX, posY);
    rad += dRad * 0.25;

    if (rad <= 0 || rad > maxSize) {
      dRad *= -1;
    }
    
    sphere(rad);

  }
  
}

ArrayList<Orbital> orbitals;
float[] rgb = {random(255), random(255), random(255)};
float c = random(255);

void setup() {
  size(640, 560, P3D);
  noStroke();
  fill(204);
  
  orbitals = new ArrayList<Orbital>();
  int numO = 3 + (int)random(10);
  for (int i = 0; i < numO; i++) {
    orbitals.add(new Orbital(20 + random(100)));
  }
}

void draw() { 
  delay(10);  // helps lower cpu load
  background(255);
  translate(width / 2, height / 2); 
  pointLight(c, c, c, 0, 0, 0);
  pointLight(c, c, c, width/2, height/2, 100);

  for (Orbital o : orbitals) {
    o.draw();
  }

}
