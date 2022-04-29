import controlP5.*; //imports the ControlP5 library
import processing.serial.*; //import serial library


//start variable declaration

ControlP5 cp5; //create a ControlP5 object
                                                                  //Serial port;
//end variable declaration


void setup(){ //setup function

  size(700,300); //window size that we will use width,height

  cp5 = new ControlP5(this); //create a new instance of class ConrtolP5
                                                        //port = new Serial(this, "COM4", 9600); //connect arduino to HC-06

//start movement controls
  
  cp5.addButton("forward")        //forward
    .setPosition(190, 50) 
    .setSize(120, 70);
  
  cp5.addButton("backwards")      //reverse
    .setPosition(190, 210)
    .setSize(120, 70);
  
  cp5.addButton("right")           //right 
    .setPosition(330, 130)
    .setSize(120, 70);
  
  cp5.addButton("left")          //left
    .setPosition(50, 130)
    .setSize(120, 70);
//end movement controls
  
// start lift controls

  cp5.addButton("lift")              //raise the scoop
    .setPosition(500, 130)
    .setSize(120, 70);  
 
 ////start stop lift button
 //cp5.addButton("stopLift")
 //   .setPosition(500,130)
 //   .setSize(120,70);
 // //end stop lift button
  
   cp5.addButton("lower")              //lower the scoop
    .setPosition(500, 210)
    .setSize(120, 70);


//end lift controls

//start speed control buttons

 
  cp5.addButton("zero")                 // movement speed will be set to zero%          
   .setPosition(190, 130)                
   .setSize(120, 70); 
  
  cp5.addButton("twentyFive")          // movement speed will be set to 25%
   .setPosition(450, 50)                
   .setSize(50, 50);
  
  cp5.addButton("fifty")                // movement speed will be set to 50%
   .setPosition(510, 50)                
   .setSize(50, 50);
  
  cp5.addButton("seventyFive")         // movement speed will be set 75%
   .setPosition(570, 50)                
   .setSize(50, 50);
  
  cp5.addButton("hundred")              // movement speed will be set 100%
   .setPosition(630, 50)                
   .setSize(50, 50);

//end speed control buttons
}

void draw(){
  
  background(211,211,211); //creates a dark grey background for the control panel
  

}


//button call functions
/*
void forward(){
  port.write('f'); //will write this to ardiuno so computer knows what action to preform
}

void backwards(){
  port.write('r');
}

void left(){
  port.write('x');
}

void right(){
  port.write('b');
}

void lift(){
  port.write('u');
}

void lower(){
  port.write('d');
}




//speed levels zxcvb   0 - 100
  //start speed controls

void zero(){
  port.write('z');
}

void twentFive(){
  port.write('x');
}

void fifty(){
  port.write('c');
}

void seventyFive(){
  port.write('v');
}

void hundred(){
  port.write('b');
}

  //end speed controls
  */
