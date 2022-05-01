//please download libary" minim" before play

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer Sound;

//int nbCubes;
//Cube[] cubes;

float n4;
float n6;
void setup()
{
  fullScreen(P3D);
  noCursor();
  smooth(2);
  background(0);
  frameRate(30);  
  
  minim = new Minim(this);
  Sound = minim.loadFile("alltowell.mp3");
  Sound.play();
}
void draw()
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
    
    fill(#0CECDD);
    ellipse(x1,x2, Sound.left.get(i)*20, Sound.left.get(i)*20);
    
    fill(#FFF338);
    ellipse(x1,x2, Sound.right.get(i)*20, Sound.right.get(i)*20);
    
    fill(#FF67E7); 
    ellipse(x, y, Sound.right.get(i)*10, Sound.left.get(i)*20);

    fill(#04009A);
    ellipse(x, y, Sound.right.get(i)*20, Sound.left.get(i)*10);
    
    //for(int i = 0; i < nbCubes; i++)
  //{

    //float bandValue = fft.getBand(i);
    //cubes[i].display(scoreLow, scoreMid, scoreHi, bandValue, scoreGlobal);
  //}
  }
    n4 += 0.008;
  n6 += 0.04;

}
