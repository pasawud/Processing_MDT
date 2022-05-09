//please download libary" minim" before play

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer Sound;
AudioMetaData meta;
BeatDetect beat;
int  r = 450;
float rad = 200;   

float n4;
float n6;
void setup()
{
  fullScreen(P3D);
  
  minim = new Minim(this);
  Sound = minim.loadFile("alltowell.mp3");
  beat = new BeatDetect();
  meta = Sound.getMetaData();
  Sound.play();
  noCursor();
  smooth(2);
  background(0);
  frameRate(30);  
}
void draw()
{
  show2();
  show();
}
void show()
{
  beat.detect(Sound.mix);
  fill(-1, 10);
  if (beat.isOnset()) rad = rad*0.9;
  else rad = 200;
  ellipse(0, 0, 2*rad, 2*rad);
  stroke(-1, 100);
  int bsize = Sound.bufferSize();
  for (int i = 0; i < bsize - 1; i+=5)
  {
    float x = (r)*cos(i*2*PI/bsize);
    float y = (r)*sin(i*2*PI/bsize);
    float x2 = (r + Sound.left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + Sound.left.get(i)*100)*sin(i*2*PI/bsize);
    line(x, y, x2, y2);
  }
  beginShape();
  noFill();
  stroke(-1, 50);
  for (int i = 0; i < bsize; i+=100)
  {
    float x2 = (r + Sound.left.get(i)*100)*cos(i*2*PI/bsize);
    float y2 = (r + Sound.left.get(i)*100)*sin(i*2*PI/bsize);
    vertex(x2, y2);
    pushStyle();
    stroke(-1);
    strokeWeight(2);
    point(x2, y2);
    popStyle();
  }
  endShape();
}
void show2()
{
  fill(0,50);
  noStroke();
  rect(0,0, width,height);
  translate(width/2,height/2);
  
  for (int i = 0; i < Sound.bufferSize(); i++)
  {
    float angle = sin(i+n4)*10;
    float angle2 = sin(i+n6)*350;
    
    float x = sin(radians(i))*(angle2+300);
    float y = cos(radians(i))*(angle2+300);
    
    float x1 = sin(radians(i))*(500/angle);
    float x2 = cos(radians(i))*(500/angle);
    
    fill(#F1DDBF);
    ellipse(x1,x2, Sound.left.get(i)*20, Sound.left.get(i)*20);
    
    fill(#525E75);
    ellipse(x1,x2, Sound.right.get(i)*20, Sound.right.get(i)*20);
    
    fill(#78938A); 
    ellipse(x, y, Sound.right.get(i)*10, Sound.left.get(i)*20);

    fill(#92BA92);
    ellipse(x, y, Sound.right.get(i)*20, Sound.left.get(i)*10);
    
  }
  n4 += 0.008;
  n6 += 0.04;
}
