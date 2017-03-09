/*Ethan Yant
Pd. 2
Garda
Starfield */

Particle [] particles;
void setup()
{
  size(400,400);
   particles = new Particle[500];
   particles [0] = new OddballParticle();
   particles [1] = new JumboParticle();
   
   for(int i = 2; i < particles.length; i++) {
     particles [i] = new NormalParticle();
  }
  
}
void draw()
{
 background(0);
  for(int i = 0; i < particles.length; i++) {
   particles[i].show();
   particles[i].move();
  }
}
class NormalParticle implements Particle
{
  private double x, y, speed, angle;
  private int Color, direction;
  
  NormalParticle() {
    x = 200;
    y = 200;
    direction = 0;
    speed = Math.random() * 10;
    angle = Math.PI * Math.random() * 2;
    Color = color(random(255), random(255), random(255));
  }
  public void move() {
    if(keyPressed) {
      speed = Math.random() * 5;
    }
    
    if(mousePressed) {
      if(x <= 200) {
          x+= 2; }
       else if(x >= 200) {
         x-= 2; }
      if(y <= 200) {
        y+= 2; }
        else if(y >= 200) {
          y-= 2;}
    }
     else {    
      if(x >= 390 || y >= 390) {
        direction = 1; }
      else if(x <= 0 || y <= 0) {
        direction = 0; }
     
      if(direction == 0) {  
        x = x + (Math.cos(angle) * speed);
        y = y + (Math.sin(angle) * speed);
      }
      else if (direction == 1) {
        x = x - (Math.cos(angle) * speed);
        y = y - (Math.sin(angle) * speed);
      }
     }
  }
  public void show() {
    fill(Color);
    ellipse((float)x,(float)y,10.0,10.0);
  }
}

interface Particle
{
  public void move();
  public void show();
}

class OddballParticle implements Particle {
  private double x, y, angle, speed;
  private int Color, direction;
  
  OddballParticle() {
    x = random(200);
    y = random(200);
    direction = 0;
    speed = Math.random() * 10;
    angle = Math.PI * Math.random() * 2;
    Color = color(random(255), random(255), random(255)); 
  }

  public void move() {
    if(x >= 375 || y >= 375) {
        direction = 1; }
      else if(x <= 0 || y <= 0) {
        direction = 0; }
     
     if(direction == 0) {
      x = x + random(25);
      y = y + random(25); }
      else if(direction == 1) {
        x = x - random(25);
        y = y - random(25); }
  }
  public void show() {
    fill(Color);
    if(x < 375 && y < 375) {
      rect((float)x,(float)y,50.0,50.0);
    }
  }
}
class JumboParticle implements Particle
{
  private double x, y, speed, angle;
  private int Color;
  
  JumboParticle() {
    x = 200;
    y = 200;
    speed = Math.random() * 10;
    angle = Math.PI * Math.random() * 2;
    Color = color(random(255), random(255), random(255));
  }
  public void move() {
    x = x + (Math.cos(angle) * speed);
    y = y + (Math.sin(angle) * speed);
  }
  public void show() {
    fill(Color);
    ellipse((float)x,(float)y,50.0,50.0);
  }
}
