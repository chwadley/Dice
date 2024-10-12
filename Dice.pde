class Die {
  int n;
  float x;
  float y;
  float s;
  float r;
  float a;
  float rad;
  boolean setxy;
  Die(float _x, float _y, float _s, float _r, float _a, float _rad, boolean _setxy) {
    x=_x;
    y=_y;
    s=_s;
    r=_r;
    a=_a;
    rad=_rad;
    setxy=_setxy;
    if (_setxy) {
      x=width/2+cos(_a)*_rad;
      y=height/2+sin(_a)*_rad;
    }
    roll();
  }
  void roll() {
    n=(int)(Math.random()*6)+1;
    score+=n;
  }
  void update() {
    if (setxy) {
      x=width/2+cos(a)*rad;
      y=height/2+sin(a)*rad;
    }
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

ArrayList <Die> d=new ArrayList <Die>();
int score=0;
float s;
int[] price={100};

void setup() {
  size(1000,1000);
  s=50;
  for (int i=0;i<1;i++) {
    d.add(new Die(width/2,height/2,s,0,0,width/3,false));
  }
}

void draw() {
  background(220);
  for (int i=0;i<d.size();i++) {
    d.get(i).r+=0.01;
    d.get(i).a+=0.005;
    d.get(i).update();
    d.get(i).show();
    fill(0);
    noStroke();
  }
  if (frameCount%60==0) {
    for (int i=1;i<d.size();i++) {
      d.get(i).roll();
      d.get(i).update();
      d.get(i).show();
    }
  }
  fill(255);
  stroke(0);
  strokeWeight(2);
  rectMode(CORNER);
  rect(5,5,100,50,5);
  rect(5,60,100,50,5);
  //rect(5,115,100,50,5);
  fill(0);
  noStroke();
  textAlign(CENTER,CENTER);
  textSize(30);
  text(score,5+100/2,5+50/2-3);
  text(price[0],5+100/2,60+50/2-3);
}

void mousePressed() {
  if (mouseX>=5&&mouseY>=60&&mouseX<=105&&mouseY<=110) {
    if (score>price[0]) {
      addDie();
      score-=price[0];
      price[0]*=1.1;
    }
  }
  d.get(0).roll();
}

void addDie() {
  d.add(new Die(0,0,s,0,d.get(d.size()-1).a+0.2,width/3,true));
}
