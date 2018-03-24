
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress direccionRemota;

float x,y,t,ka,pa,bu;
float v = random(10,20);

void setup() {
  size(800, 600);
  
  oscP5 = new OscP5(this, 12000);
  direccionRemota = new NetAddress("127.0.0.1", 12001);
  frameRate(v);
}

void draw() {
  background(237);  
  stroke(0);
  circulo(200,200,random(350));
  circulo2(100,100,random(80));
  
  fill(random(255),random(255),random(255),50); 
   circulo(x+t/2,y+80,t+x); //der
      circulo(x-t/2,y,t/2); //izq
      circulo(x,y+20,t+y); //abajo
      
     circulo2(pa+bu,pa+40,bu); //der
     circulo2(ka-bu/2,pa/2,bu/3); //izq
     circulo2(pa+50,pa+10,bu+20); //abajo 
      
    //  circulo2(ka+bu/2,pa+10,bu/2); //der
     // circulo2(ka-bu/2,pa+20,bu/2); //izq
    //  circulo2(ka,pa+10,bu/2); //abajo 
}

void circulo(float x, float y, float t){
 fill(random(255),random(255),random(255),50);
  noStroke();
  ellipse(x+200,y+100,t,t);
    if(t>10){ 
    }
}

void circulo2(float ka, float pa, float bu){
fill(random(2,80),random(10,200),random(140,255),160);
  noStroke();
  ellipse(ka+200,pa+100,bu,bu);
    if(t>4){
    }   
}

void mousePressed() {
  OscMessage mensaje = new OscMessage("/mouseX");
  mensaje.add(mouseX); 
  oscP5.send(mensaje, direccionRemota);
}

void oscEvent(OscMessage theOscMessage) {  
  if (theOscMessage.checkAddrPattern("/x") == true) {
    x = theOscMessage.get(0).intValue();
  }

  if (theOscMessage.checkAddrPattern("/y") == true) {
    y = theOscMessage.get(0).intValue();
  }
  
  if (theOscMessage.checkAddrPattern("/t") == true) {
    t = theOscMessage.get(0).intValue();
  }
  
  if (theOscMessage.checkAddrPattern("/v") == true) {
    v = theOscMessage.get(0).intValue();
  }
  
    if (theOscMessage.checkAddrPattern("/ka") == true) {
    ka = theOscMessage.get(0).intValue();
  }
  
     if (theOscMessage.checkAddrPattern("/pa") == true) {
    pa = theOscMessage.get(0).intValue();
  }
  
     if (theOscMessage.checkAddrPattern("/bu") == true) {
    bu = theOscMessage.get(0).intValue();
  }
}