// select the input pin for LDR
int sensorPin = A0;
// store the value coming from the sensor 
int sensorValue = 0; 

// select the input pin for the LED
int led = 13; 
int led2 = 12;

void setup() {
  //sets serial port for communication
  Serial.begin(9600); 
  
  // initialize digital pin led and led2 as an output.
  pinMode(led, OUTPUT);
  pinMode(led2, OUTPUT);
}


void loop() {
  sensorValue = analogRead(sensorPin); 
  
  //prints the values coming from the sensor on the serial monitor
  Serial.println(sensorValue); 


  // if the light the red LED will flash
  // otherwise the yellow LED will flash
  if (sensorValue < 600){
    digitalWrite(led, HIGH);   
    delay(100);               
    digitalWrite(led, LOW);    
    delay(100); 
  }
  else {
    digitalWrite(led2, HIGH);
    delay(100);
    digitalWrite(led2, LOW);
    delay(100);
  }
}
