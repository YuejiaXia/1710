PImage img;
ArrayList<Dot> dots;
int scaler = 3;

void setup() {
  size(100, 100);
  img = loadImage("dog.png");
  surface.setSize(img.width, img.height);
  img.loadPixels();
  dots = new ArrayList<Dot>();
  for (int x = 0; x < img.width; x += scaler) {
    for (int y = 0; y < img.height; y += scaler) {
      int loc = x + y * (img.width);
      dots.add(new Dot(x, y, img.pixels[loc]));
    }
  }
}

void draw() {
  background(0);
  for (Dot dot : dots) {
    dot.run();
  }
  
}
