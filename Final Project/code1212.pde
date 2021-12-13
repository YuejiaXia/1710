//导入音乐处理库文件
import ddf.minim.*;
import ddf.minim.ugens.*;
Minim minim;

//导入音乐文件
AudioPlayer soundc;
AudioPlayer soundcsharp;
AudioPlayer soundd;
AudioPlayer sounddsharp;
AudioPlayer sounde;
AudioPlayer soundf;
AudioPlayer soundfsharp;
AudioPlayer soundg;
AudioPlayer soundgsharp;
AudioPlayer sounda;
AudioPlayer soundasharp;
AudioPlayer soundb;

AudioPlayer sound1;
AudioPlayer sound2;
AudioPlayer sound3;
AudioPlayer sound4;
AudioPlayer sound5;

// for playing back
AudioOutput out;
FilePlayer player;



//设置颜色以及透明度
int color_R, color_G, color_B;
int Transparent=1;

//根据鼠标位置绘制的圆形图案的位置
int xpos = 0;
int ypos3=50;
float circleypos=0;


//吉他的音乐文件
int l=50;
int x1, y;
float ox, oy;
float lastX, lastY;

float dx, dy;
float dis;
float st;
int check = 0;
int sc=10;





void setup() {
  size(1000, 900);
  background(255);
  //加载音乐文件
  minim = new Minim(this);
  soundc = minim.loadFile("c.mp3");
  soundcsharp = minim.loadFile("csharp.mp3");
  soundd = minim.loadFile("d.mp3");
  sounddsharp = minim.loadFile("dsharp.mp3");
  sounde = minim.loadFile("e.mp3");
  soundf = minim.loadFile("f.mp3");
  soundfsharp = minim.loadFile("fsharp.mp3");
  soundg = minim.loadFile("g.mp3");
  soundgsharp = minim.loadFile("gsharp.mp3");
  sounda = minim.loadFile("a.mp3");
  soundasharp = minim.loadFile("asharp.mp3");
  soundb = minim.loadFile("b.mp3");


  // get an output we can playback the recording on
  textFont(createFont("Arial", 12));
  lastX=0;
  lastY=0;

  //final1
}


//绘制图像
void draw() {
  //钢琴

  strokeWeight(2);
  stroke(0);
  f();
  c();
  d();
  e();
  g();
  b();
  a();
  dmode();
  cmode();
  amode();
  fmode();
  textSize(30);
}

//根据鼠标点击的位置来控制钢琴发出的声音
void mousePressed() {
  Transparent=Transparent+10;
  if ((mouseX > 200 && mouseX < 285.71 && mouseY > 320+400 && mouseY < 450+400 && mousePressed) || (mouseX > 200 && mouseX < 264.2825 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    cy();
  }
  if ((mouseX > 285.71 && mouseX < 371.42 && mouseY > 320+400 && mouseY < 450+400 && mousePressed) || (mouseX > 307.1375 && mouseX < 349.9925 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    dy();
  }
  if ((mouseX > 371.42 && mouseX < 457.13 && mouseY > 320+400 && mouseY < 450+400 && mousePressed) || (mouseX > 392.8475 && mouseX < 457.13 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    ey();
  }
  if ((mouseX > 457.13 && mouseX < 542.84 && mouseY > 320+400 && mouseY < 450 +400&& mousePressed) || (mouseX > 457.13 && mouseX < 521.4125 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    fy();
  }
  if ((mouseX > 542.84 && mouseX < 628.55 && mouseY > 320+400 && mouseY < 450+400 && mousePressed) || (mouseX > 564.2675 && mouseX < 607.1225 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    gy();
  }
  if ((mouseX > 628.55 && mouseX < 714.26 && mouseY > 320 +400&& mouseY < 450+400 && mousePressed) || (mouseX > 649.9775 && mouseX < 692.8325 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    ay() ;
  }
  if ((mouseX > 714.26 && mouseX < 799.97 && mouseY > 320+400 && mouseY < 450+400 && mousePressed) || (mouseX > 735.6875 && mouseX < 799.97 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    by();
  }
  if (mouseX > 264.2825 && mouseX < 307.1375 && mouseY > 150+400 && mouseY < 320+400 && mousePressed) {
    csharpy() ;
    ypos3= ypos3+5;
  }
  if (mouseX > 349.9925 && mouseX < 392.8475 && mouseY > 150+400 && mouseY < 320+400 && mousePressed) {
    dsharpy ();
  }
  if (mouseX > 521.4125 && mouseX < 564.2675 && mouseY > 150+400 && mouseY < 320+400 && mousePressed) {
    fsharpy() ;
  }
  if (mouseX > 607.1225 && mouseX < 649.9775 && mouseY > 150+400 && mouseY < 320+400 && mousePressed) {
    gsharpy() ;
  }
  if (mouseX > 692.8325 && mouseX < 735.6875 && mouseY > 150+400 && mouseY < 320+400 && mousePressed) {
    asharpy() ;
  }
}

//当鼠标在钢琴不同个位置的时候，播放不同的音乐
void sharpy1() {
  sound1.rewind();
  sound1.play();
  fill(random(255), random(255), random(255), random(155));
  rect(random(width), random(height), random(50), random(50));
}
void sharpy2() {
  sound2.rewind();
  sound2.play();
}
void sharpy3() {
  sound3.rewind();
  sound3.play();
}
void sharpy4() {
  sound4.rewind();
  sound4.play();
}
void sharpy5() {
  sound5.rewind();
  sound5.play();
  fill(random(255), random(255), random(255), random(155));
  ellipse(random(width), random(height), random(50), random(50));
}

void cy() {
  soundc.rewind();
  soundc.play();
}
void dy() {
  soundd.rewind();
  soundd.play();
}
void ey() {
  sounde.rewind();
  sounde.play();
}
void fy() {
  soundf.rewind();
  soundf.play();
}
void gy() {
  soundg.rewind();
  soundg.play();
}
void ay() {
  sounda.rewind();
  sounda.play();
}
void by() {
  soundb.rewind();
  soundb.play();
}
void csharpy() {
  soundcsharp.rewind();
  soundcsharp.play();
}
void dsharpy() {
  sounddsharp.rewind();
  sounddsharp.play();
}
void fsharpy() {
  soundfsharp.rewind();
  soundfsharp.play();
}
void gsharpy() {
  soundgsharp.rewind();
  soundgsharp.play();
}
void asharpy() {
  soundasharp.rewind();
  soundasharp.play();
}

//当鼠标按下第一个白色键时
void c() {
  boolean c = false;

  color_R=255;
  color_G=255;
  color_B=255;
  if ((mouseX > 200 && mouseX < 285.71 && mouseY > 320+400 && mouseY < 450+400 && mousePressed) || (mouseX > 200 && mouseX < 264.2825 && mouseY >400+ 150 && mouseY < 450+400 && mousePressed)) {
    c = true;
  } else { 
    c = false;
  }
  //背景绘制圆形的图案
  float randomheight=random(0, height);
  float randomheight1=random(0, height);
  if (c == true) {
    color_G = 125;
    color_B = 125;
    fill(255, 125, 125, random(100));
    xpos = xpos + 6;
    noStroke();
    //绘制背景的圆形
    ellipse(xpos, randomheight, random(300, 500), random(10));
    stroke(0);
    strokeWeight(3);
  } else {
    color_R = 255;
    color_B = 255;
    strokeWeight(3);
    xpos = 0;
    circleypos = random(50, 550);
  }
  strokeWeight(3);
  fill(color_R, color_G, color_B);
  rect(200, 150+400, 85.71, 300);
}

//当鼠标按下第二个白色键时
void d() {
  float x = random(0, width);
  float y = random(0, height);
  float size = random(0, 60);
  boolean d = false;
  int dr=255;
  int dg=255;
  int db=255;
  if ((mouseX > 285.71 && mouseX < 371.42 && mouseY > 320 && mouseY < 450 && mousePressed) || (mouseX > 307.1375 && mouseX < 349.9925 && mouseY > 400+150 && mouseY < 400+450 && mousePressed)) {
    d = true;
  } else {  
    d = false;
  }
  //背景绘制对应的图案
  if (d == true) {
    dr = 0;
    fill(dr, dg, db, random(150));
    strokeWeight(0);
    noStroke();
    ellipse(x, y, size, size);
    stroke(0);
    strokeWeight(3);
  } else {
    dr = 255;
  }
  fill(dr, dg, db);
  rect(285.71, 150+400, 85.71, 300);
}
//当鼠标按下第三个白色键时
void e() {
  boolean e =false;
  float er=255;
  float  eg=255;
  float  eb=255;
  if ((mouseX > 371.42 && mouseX < 457.13 && mouseY > 320 && mouseY < 450 && mousePressed) || (mouseX > 392.8475 && mouseX < 457.13 && mouseY > 150 +400&& mouseY < 450 +400&& mousePressed)) {
    e = true;
  } else { 
    e = false;
  }
  if (e == true) {
    er = 205;
    eg = 103;
    eb = 204;
    fill(er, eg, eb, Transparent+30);
    stroke(0);
    strokeWeight(random(5));
    float x=random(width);
    stroke(er, eg, eb, Transparent+30);
    line(x, height, x, height-random(0, 600));
  } else {
    er = 255;
    eg = 255;
    eb = 255;
  }

  stroke(0);
  fill(er, eg, eb);
  rect(371.42, 150+400, 85.71, 300);
}
//当鼠标按下第四个白色键时
void f() {
  boolean f =false;
  int fr=255;
  int fg=255;
  int fb=255;
  if ((mouseX > 457.13 && mouseX < 542.84 && mouseY > 320 && mouseY < 450 && mousePressed) || (mouseX > 457.13 && mouseX < 521.4125 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    f = true;
  } else {  
    f = false;
  } 
  if (f == true) {
    fb = 0;
    fill(fr, fg, fb, Transparent+50);
    noStroke();
    float xtri = random(0, width-50);
    float ytri = random(0, width);
    triangle(xtri, ytri, xtri+50, ytri, 500, 0);
    stroke(0);
  } else {
    fb = 255;
  }
  fill(fr, fg, fb);
  rect(457.13, 150+400, 85.71, 300);
}
//当鼠标按下第五个白色键时
void g() {
  float x = random(0, width);
  float y = random(0, height);
  boolean g =false;
  int gr=255;
  int gg=255;
  int gb=255;
  if ((mouseX > 542.84 && mouseX < 628.55 && mouseY > 320 && mouseY < 450 && mousePressed) || (mouseX > 564.2675 && mouseX < 607.1225 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    g = true;
  } else {  
    g = false;
  }  

  if (g== true) {
    gr=55;
    gg= 155;
    gb=125;
    fill(55, 155, 125, random(150));
    xpos = xpos + 6;
    noStroke();
    //绘制背景的圆形
    ellipse(random(width), random(height), random(30), random(30));
    stroke(0);
    strokeWeight(3);
  } else {
    gr= 255;
    gg = 255;
    gb=255;
    strokeWeight(3);
  }
  fill(gr, gg, gb);
  rect(542.84, 150+400, 85.71, 300);
}
//当鼠标按下第六个白色键时
void a() {
  boolean a =false;
  int ar=255;
  int ag=255;
  int ab=255;
  if ((mouseX > 628.55 && mouseX < 714.26 && mouseY > 320 && mouseY < 450 && mousePressed) || (mouseX > 649.9775 && mouseX < 692.8325 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    a = true;
  } else {  
    a = false;
  }   
  if (a== true) {
    ar=225;
    ag= 255;
    ab=125;
    fill(225, 255, 125, random(150));
    xpos = xpos + 6;
    noStroke();
    //绘制背景的圆形
    ellipse(random(width), random(height), random(30), random(30));
    stroke(0);
    strokeWeight(3);
  } else {
    ar= 255;
    ag = 255;
    ab=255;
    strokeWeight(3);
  }
  fill(ar, ag, ab);
  rect(628.55, 150+400, 85.71, 300);
}
//当鼠标按下第七个白色键时
void b() {
  boolean b =false;
  int br=255;
  int bg=255;
  int bb=255;
  if ((mouseX > 714.26 && mouseX < 799.97 && mouseY > 320 && mouseY < 450 && mousePressed) || (mouseX > 735.6875 && mouseX < 799.97 && mouseY > 150+400 && mouseY < 450+400 && mousePressed)) {
    b = true;
  } else {  
    b = false;
  }  
  float randomheight1=random(0, height);
  if (b== true) {
    br=125;
    bg= 255;
    bb=125;
    fill(125, 255, 125, random(100));
    xpos = xpos + 6;
    noStroke();
    //绘制背景的圆形
    ellipse(width-xpos, randomheight1, random(100, 300), random(10));
    stroke(0);
    strokeWeight(3);
  } else {
    color_R = 255;
    color_B = 255;
    strokeWeight(3);
    xpos = 0;
    circleypos = random(50, 550);
  }
  fill(br, bg, bb);
  rect(714.26, 150+400, 85.71, 300);
}

//鼠标按下第一个黑键
void cmode() {
  boolean cmode =false;
  int csr=0;
  int csg=0;
  int csb=0;
  float randomx=random(0, width);
  if (mouseX > 264.2825 && mouseX < 307.1375 && mouseY >400+ 150 && mouseY < 400+320 && mousePressed) {
    cmode = true;
  } else {  
    cmode = false;
  }   
  fill(csr, csg, csb);
  rect(264.2825, 150+400, 42.855, 170);
}

//鼠标按下第二个黑键
void dmode() {
  boolean dmode =false;
  int dsr=0;
  int dsg=0;
  int dsb=0;
  if (mouseX > 349.9925 && mouseX < 392.8475 && mouseY > 150+400 && mouseY < 320+400 && mousePressed) {
    dmode = true;
  } else {  
    dmode = false;
  }   
  fill(dsr, dsg, dsb);
  rect(349.9925, 150+400, 42.855, 170);
}
//鼠标按下第三个黑键
void fmode() {
  boolean fmode =false;
  int fsr=0;
  int fsg=0;
  int fsb=0;
  if (mouseX > 521.4125 && mouseX < 564.2675 && mouseY > 150+400 && mouseY < 320+400 && mousePressed) {
    fmode = true;
  } else {  
    fmode = false;
  }   

  fill(fsr, fsg, fsb);
  rect(521.4125, 150+400, 42.855, 170);
}
//鼠标按下第四个黑键
void amode() {
  boolean amode =false;
  int asr=0;
  int asg=0;
  int asb=0;
  if (mouseX > 692.8325 && mouseX < 735.6875 && mouseY >400+ 150 && mouseY < 400+320 && mousePressed) {
    amode = true;
  } else {  
    amode = false;
  }   
  fill(asr, asg, asb);
  rect(692.8325, 150+400, 42.855, 170);
}
