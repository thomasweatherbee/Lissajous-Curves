int circleQuant = 10;
float radius;
float angle = 0;
float[][] coords = new float[circleQuant][2];

void setup() {
  size(1000, 1000);
  noFill();
  strokeWeight(1);
  stroke(255);
  background(51);
  radius = (width/(circleQuant+1))/2;
  for (int i = 0; i < circleQuant; i++) {
    ellipse(((2*i)+3)*radius, radius, radius*1.5, radius*1.5);
    ellipse(radius, ((2*i)+3)*radius, radius*1.5, radius*1.5);
  }
  frameRate(60);
}

void draw() {
  //background(51);
  //strokeWeight(3);
  //for(int i = 0; i < circleQuant; i++){
  //  ellipse(((2*i)+3)*radius, radius, radius*1.5, radius*1.5);
  //  ellipse(radius, ((2*i)+3)*radius, radius*1.5, radius*1.5);
  //}
  for (int i = 0; i < circleQuant; i++) {
    int rotate = 0;
    float tempAngle = (i + 1) * angle;
    float x_coord, y_coord;
    if (int(tempAngle/90) >= 1) {
      rotate+=int(tempAngle/90);
      tempAngle -= 90 * int(tempAngle/90);
    }
    x_coord = sin(radians(tempAngle)) * radius * 0.75;
    y_coord = cos(radians(tempAngle)) * radius * 0.75;
    for (int j = 0; j < rotate; j++) {
      float temp = x_coord;
      x_coord = y_coord;
      y_coord = temp * -1;
    }
    //strokeWeight(7);
    //point(((2*i)+3)*radius + x_coord, radius - y_coord);
    //point(radius + x_coord, ((2*i)+3)*radius - y_coord);
    strokeWeight(1);
    //line(((2*i)+3)*radius + x_coord, radius - y_coord, ((2*i)+3)*radius + x_coord, height);
    //line(radius + x_coord, ((2*i)+3)*radius - y_coord, width, ((2*i)+3)*radius - y_coord);
    coords[i][0] = ((2*i)+3)*radius + x_coord;
    coords[i][1] = ((2*i)+3)*radius - y_coord;
  }
  angle++;
  if (angle > 360) {
    angle = 0;
  }
  strokeWeight(1);
  for (int i = 0; i < coords.length; i++) {
    for (int j = 0; j < coords.length; j++) {
      point(coords[i][0], coords[j][1]);
    }
  }
}
