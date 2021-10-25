float maxDistance;
Squid squid;
Stars stars;
void setup() {
  fullScreen();
  //size(800, 800);
  colorMode(HSB, 360);
  ellipseMode(CENTER);

  maxDistance = sqrt((width / 2) * (width / 2) + (height / 2) * (height / 2)); 
  squid = new Squid(0, 0, 1);
  stars = new Stars(0, 0, 80);
}

void draw() {
  background(0); 
  translate(width / 2, height / 2); 

  PVector velocity = velocityByDistanceToCenter();

  if (stars.findFood()) {
    squid.grow();
  }

  squid.update(velocity); 
  velocity.mult(-1);
  stars.update(velocity);

  stars.display();
  squid.display();
}


PVector velocityByDistanceToCenter() {
  PVector mouse = new PVector(mouseX, mouseY); 
  PVector center = new PVector(width / 2, height / 2); 
  PVector direction = PVector.sub(mouse, center);
  float distance = direction.mag(); 
  direction.normalize();
  float speed = map(distance, 0, maxDistance, 5, 20); 
  direction.mult(speed);
  return direction;
}

class Squid {
  Tentacle [] tens; 
  float scaleRatio;
  PVector location;

  Squid(float x, float y, int cnt) {
    tens = new Tentacle[cnt];

    for (int i = 0; i < tens.length; i++) {
      float theta = map(i, 0, tens.length, 0, TWO_PI); 
      float minHue = map(i, 0, tens.length, 0, 946); 
      float maxHue = map(i + 1, 0, tens.length, 0, 946); 
      tens[i] = new Tentacle(theta, minHue, maxHue);
    }
    location  = new PVector(x, y);
  }

  void grow() {
    for (int i = 0; i < tens.length; i++) {
      tens[i].addLimb();
    }
  }

  void update(PVector velocity) {
    scaleRatio = map(velocity.mag(), 11, 35, 1, 2); 
    location.add(velocity);
    for (Tentacle t : tens) {
      t.update(location.x, location.y);
    }
  }

  void display() {
    scale(scaleRatio);
    translate(-location.x, -location.y); 
    for (int i = 0; i < tens.length; i++) {
      tens[i].display();
    }

    translate(location.x, location.y); 
    fill(30); 
    stroke(30); 
    strokeWeight(3.5);
  }
}


class Limb {
  float startX, startY, endX, endY; 
  float offsetX, offsetY; 
  float currentX, currentY; 
  float size; 
  float amt; 

  Limb(float _size, float theta) {
    size = _size; 
    offsetX = 6 * cos(theta); 
    offsetY = 6 * sin(theta); 
    amt = 0.4;
  }

  void update(float x, float y) {
    startX = x; 
    startY = y; 
    endX = startX + offsetX; 
    endY = startY + offsetY; 

    transition();
  }

  void transition() {
    currentX = lerp(currentX, endX, amt); 
    currentY = lerp(currentY, endY, amt);
  }


  void display() {
    strokeWeight(size + 7); 
    line(startX, startY, currentX, currentY); 
    strokeWeight(size / 2 + 7); 
    point(startX + (offsetX*-0.3), startY + (offsetY *1.5));
  }
}
class Stars { 
  PVector [] stars;
  PVector center;
  Stars(float x, float y, int cnt) {
    stars = new PVector[cnt];
    for (int i = 0; i< cnt; i++) {
      stars[i] = new PVector(random(-width, width), random(-height, height), random(10, 20));
    }
    center = new PVector(x, y);
  }

  void update(PVector velocity) {
    center.add(velocity);

    for (int i = 0; i < stars.length; i++) {
      PVector s = stars[i];
      if (velocity.x > 0 && s.x + center.x > width) {
        s.x -= width * 2;
      } else if (velocity.x < 0 && s.x + center.x < -width) {
        s.x += width * 2;
      }

      if (velocity.y > 0 && s.y + center.y > height) {
        s.y -= height * 2;
      } else if (velocity.y < 0 && s.y + center.y < -height) {
        s.y += height * 2;
      }
    }
  }

  boolean findFood() {
    int len = stars.length;
    PVector food = stars[len - 1];
    PVector location = PVector.add(food, center);

    if (location.mag() < 100) {
      food.set(random(-width, width), random(-height, height), random(10, 30));
      return true;
    }
    return false;
  }

  void display() {
    pushMatrix();
    translate(center.x, center.y); 
    for (int i = 0; i < stars.length; i++) {
      PVector s = stars[i];
      if (i == stars.length - 1) {
        float hue = map(s.z, 10, 30, 0, 360);
        fill(hue, 360, 360);
        drawStar(s.x, s.y, s.z, s.z);
      } else {
        fill(62,351,350,197);
        ellipse(s.x, s.y, s.z, s.z);
      }
    }
    popMatrix();
  }

  void drawStar(float x, float y, float w, float h) {
    pushMatrix();
    float period = 3000;
    float intensity = 5;
    float t = atan(sin((millis() % period) / period * 2 * PI) * intensity) / PI + 0.5;
    float rate = t + 1;
    translate(x, y);
    scale(rate * 3);
    ellipse(0, 0, w, h);
    popMatrix();
  }
}

class Tentacle {
  Limb [] segments = new Limb[1]; 
  float minHue, maxHue; 
  float theta;
  Tentacle(float _theta, float _minHue, float _maxHue) {
    theta = _theta;
    for (int i = 0; i < segments.length; i++) {
      float size = 45 -(i * 1.75); 
      segments[i] = new Limb(size, theta); 
      minHue = _minHue; 
      maxHue = _maxHue;
    }
  }

  void addLimb() {
    float size = 45 - segments.length * 1.75;
    int len = segments.length;
    size = size > 4 ? size : 4;
    Limb l = new Limb(size, theta);
    l.currentX = segments[len - 1].endX;
    l.currentY = segments[len - 1].endY;
    segments = (Limb[]) append(segments, l);
  }

  void update(float x, float y) {
    for (int i = 0; i < segments.length; i++) {
      if (i == 0) {   
        segments[i].update(x, y);
      } else {   
        segments[i].update(segments[i-1].currentX, segments[i-1].currentY);
      }
    }
  }

  void display() {
    for (int i = 0; i < segments.length; i++) {
      stroke(214, 286, 337,80); 
      segments[i].display();
    }
  }
}
