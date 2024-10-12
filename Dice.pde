class Die {
  int n;
  float x;
  float y;
  float s;
  float r;
  Die(float _x, float _y, float _s, float _r) {
    x=_x;
    y=_y;
    s=_s;
    r=_r;
    roll();
  }
  void roll() {
    n=(int)(Math.random()*6)+1;
  }
  void show() {
    rectMode(CENTER);
    fill(255);
    stroke(0);
    translate(x,y);
    rotate(r);
    rect(0,0,s,s,s/4);
    rotate(-r);
    //translate(-x,-y);
    
    noStroke();
    fill(n!=1?0:255);
    ellipse(-s/3.5,-s/3.5,s/6,s/6);
    fill(n==6?0:255);
    ellipse(-s/3.5,0,s/6,s/6);
    fill(n>3?0:255);
    ellipse(-s/3.5,s/3.5,s/6,s/6);
    fill(n>3?0:255);
    ellipse(s/3.5,-s/3.5,s/6,s/6);
    fill(n==6?0:255);
    ellipse(s/3.5,0,s/6,s/6);
    fill(n!=1?0:255);
    ellipse(s/3.5,s/3.5,s/6,s/6);
    fill(n%2==1?0:255);
    ellipse(0,0,s/6,s/6);
    translate(-x,-y);
  }
}

Die[] d=new Die[225];
int t=0;
int t2=0;
int s;

void setup() {
  size(1000,1000);
  s=50;
  for (int y=0;y<15;y++) {
    for (int x=0;x<15;x++) {
      d[x+y*15]=new Die(s/2+x*(s+10)+10,s/2+y*(s+10)+10,s,0);
    }
  }
}

void draw() {
  background(220);
  for (int i=0;i<d.length;i++) {
    d[i].r+=0.01;
    d[i].show();
    fill(0);
    noStroke();
  }
  fill(255);
  stroke(0);
  rect(width/2,height/2,300,150);
  fill(0);
  noStroke();
  textAlign(CENTER,CENTER);
  textSize(30);
  text("current total: "+Integer.toString(t),width/2,height/2-50);
  text("all-time total: "+Integer.toString(t2),width/2,height/2+50);
}

void mousePressed() {
  t=0;
  for (int i=0;i<d.length;i++) {
    d[i].roll();
    t+=d[i].n;
  }
  t2+=t;
}
