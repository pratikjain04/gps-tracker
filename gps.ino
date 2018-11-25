#include <SoftwareSerial.h> 
#include <TinyGPS.h> 
#include<ESP8266WiFi.h>
#define key "KNRDYFIA4866U071"

const char* host="184.106.153.149";
float lat,lon;  // create variable for latitude and longitude object  
SoftwareSerial gpsSerial(3,4);  //rx,tx 
TinyGPS gps; // create gps object 

void setup(){ 
Serial.begin(9600); // connect serial 
//Serial.println("The GPS Received Signal:"); 
gpsSerial.begin(9600); // connect gps sensor
  
} 
void loop(){ 
  
  while(gpsSerial.available()){ 
  // check for gps data 
    Serial.println("OOK");
  if(gps.encode(gpsSerial.read()))// encode gps data 
  {  
  gps.f_get_position(&lat,&lon); // get latitude and longitude 
  // display position 
 } 
} 
String latitude = String(lat,6); 
  String longitude = String(lon,6); 
Serial.println(latitude+";"+longitude); 
delay(1000); 
} 
