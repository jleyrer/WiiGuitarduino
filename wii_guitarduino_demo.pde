/*
  Wii Guitarduino Demo
  
  This is a demonstration of the wii_guitar_funcs library. This sketch uses the Arduino's 
  digital I/O pins to light LEDs which correspond to Wii guitar (the one sold/used with
  Guitar Hero 3) button/joystick/whammy bar interactions. 

  2008 - Jason Leyrer - http://www.jleyrer.net
  
*/

#include <Wire.h>
#include "wii_guitar_funcs.h"

// assign LED pins
int greenPin = 7;
int redPin = 6;
int yellowPin = 5;
int bluePin = 4;
int orangePin = 3;
int plusPin = 8;
int minusPin = 9;
int whammyPin = 10;
int downStrumPin = 11;
int upStrumPin = 12;

void setup()
{
  // set baud rate
  Serial.begin(19200);
  
  // set LED pins to OUTPUT
  pinMode(greenPin, OUTPUT);
  pinMode(redPin, OUTPUT);
  pinMode(yellowPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
  pinMode(orangePin, OUTPUT);
  pinMode(whammyPin, OUTPUT);
  pinMode(plusPin, OUTPUT);
  pinMode(minusPin, OUTPUT);
  pinMode(downStrumPin, OUTPUT);
  pinMode(upStrumPin, OUTPUT);
  
  // init handshake
  guitar_init(); 
}

void loop()
{
  // read from the guitar
  guitar_get_data();
  // print button states
  guitar_print_data();
  
  // figure out how much we should dim the whammy bar light
  int whammy_pos = guitar_whammy_bar();
  int brightness = 255 - (( whammy_pos - 240 ) * 25);
  analogWrite(whammyPin, brightness);
  
  // Light 'em up!
  if ( guitar_green_button() ) 
  {
    digitalWrite(greenPin, HIGH);
  }
  else 
  {
    digitalWrite(greenPin, LOW);
  }
  if ( guitar_red_button() ) 
  {
    digitalWrite(redPin, HIGH);
  }
  else 
  {
    digitalWrite(redPin, LOW);
  }
  if ( guitar_yellow_button() ) 
  {
    digitalWrite(yellowPin, HIGH);
  }
  else 
  {
    digitalWrite(yellowPin, LOW);
  }
  if ( guitar_blue_button() ) 
  {
    digitalWrite(bluePin, HIGH);
  }
  else 
  {
    digitalWrite(bluePin, LOW);
  }
  if ( guitar_orange_button() ) 
  {
    digitalWrite(orangePin, HIGH);
  }
  else 
  {
    digitalWrite(orangePin, LOW);
  }
  if ( guitar_minus_button() ) 
  {
    digitalWrite(minusPin, HIGH);
  }
  else 
  {
    digitalWrite(minusPin, LOW);
  }
  if ( guitar_plus_button() ) 
  {
    digitalWrite(plusPin, HIGH);
  }
  else 
  {
    digitalWrite(plusPin, LOW);
  }
  if ( guitar_strum_down() ) 
  {
    digitalWrite(downStrumPin, HIGH);
  }
  else 
  {
    digitalWrite(downStrumPin, LOW);
  }
  if ( guitar_strum_up() ) 
  {
    digitalWrite(upStrumPin, HIGH);
  }
  else 
  {
    digitalWrite(upStrumPin, LOW);
  }
}
