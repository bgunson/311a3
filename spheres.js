let orbitals;
function setup(){
    var canvas = createCanvas(640, 480, WEBGL);
    canvas.parent("sketch");
    translate(-width/2, -height/2);
    noStroke();
    fill(204);
    orbitals=new Array();
    let numO = int(random(3, 15));
    for(let i = 0;i < numO;i++) {
        orbitals.push(new Orbital());
    }
}

function draw(){
    translate(-width/2, -height/2);
    delay(10);
    background(255);
    translate(width / 2, height / 2);
    pointLight(204, 204, 204, 0, 0, 0);
    pointLight(100, 100, 100, width / 2, height / 2, 100);
    for (let P2JSi = 0; P2JSi < orbitals.length; P2JSi++){
        let o = orbitals[P2JSi];
        o.draw();
    }
}

class Orbital{
    constructor(){
        this.posY = 0;
        this.minSize = random(5, 16);
        this.maxSize=random(20, 100);
        this.posX=this.posY=0;
        this.rad=this.maxSize;
        this.dRad=random(0.01, 0.15);
        this.radiusX=random((width / 2) - (2 * this.maxSize));
        this.radiusY=random((height / 2) - (2 * this.maxSize));
        this.theta=random(360);
        this.dTheta=random(0.01, 0.025);
    }

    draw(){
        this.theta+=this.dTheta;
        this.posX=this.radiusX * cos(this.theta);
        this.posY=this.radiusY * sin(this.theta);
        translate(this.posX, this.posY);
        this.rad+=this.dRad;
        if(this.rad <= this.minSize || this.rad > this.maxSize) {
            this.dRad*=-1;
        }
        sphere(this.rad);
    }

}


function delay( milliseconds){
   var start = new Date().getTime();
   var stop=false;
   while(!stop) {
      if ((new Date().getTime() - start) > milliseconds){
         stop=true;
    }
  }
}