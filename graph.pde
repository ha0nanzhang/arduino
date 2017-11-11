
  import processing.serial.*;

  Serial myPort;        
  int xPos = 1;         // horizontal position of the graph
  float prevY = height;
  float sensorValue = 0;

  void setup () {
    // sets the graph size
    size(400, 500);
    
    println(Serial.list());
    
    frameRate(15);

    myPort = new Serial(this, Serial.list()[0], 9600);

    // set initial background
    background(0);
  }

  void draw () { 
    // draws y axis
    stroke(255, 255, 255);
    strokeWeight(10);
    line(0, 0, 0, 500);
    for (int i = 0; i < 1100; i+=100){
      text(i, 5, (1000-i)/2);
    }
    
    // draws the line of the graph:
    stroke(255, 255, 255);
    strokeWeight(1);
    line(xPos - 1, prevY, xPos, height-sensorValue);
    prevY = height-sensorValue;

    // if line reaches the edge of the screen, go back to the beginning
    // else the line moves forward
    if (xPos >= width) {
      xPos = 0;
      background(0);
    } else {
      xPos++;
    }
  }

  void serialEvent (Serial myPort) {
    // get the string:
    String inString = myPort.readStringUntil('\n');

    if (inString != null) {
      // convert string to int and map to the screen height:
      sensorValue = float(inString);
      println(sensorValue);
      sensorValue = map(sensorValue, 0, 1000, 0, height);
    }
  }