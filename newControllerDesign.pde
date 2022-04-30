import controlP5.*; //imports the ControlP5 library
import processing.serial.*; //import serial library


//start variable declaration ------------/

ControlP5 cp5; //create a ControlP5 object

Button forward;  //movement buttons
Button right; 
Button left; 
Button backward; 

Button raise;  //scoop buttons
Button lower;
 
Button zero;    //speed buttons
Button twtyfive;
Button ffty;
Button svnfive;
Button hundred;

Serial port;  //arduino connection

//end variable declaration ---------------/

//start methods for making buttons ------------------------------------------------>

//start movement contol ------------m
void forwardSetUp(ControlP5 cp){
forward = cp.addButton("forward")        //forward
    .setPosition(190, 50) 
    .setSize(120, 70)
    .setSwitch(true);
}

void backwardSetUp(ControlP5 cp){
backward = cp.addButton("backward")        //backward
    .setPosition(190, 210)
    .setSize(120, 70)
    .setSwitch(true);
}


void rightSetUp(ControlP5 cp){
right = cp.addButton("right")        //right
    .setPosition(330, 130)
    .setSize(120, 70)
    .setSwitch(true);
}


void leftSetUp(ControlP5 cp){
left = cp.addButton("left")        //left
    .setPosition(50, 130)
    .setSize(120, 70)
    .setSwitch(true);
}

//end movement contol ------------m
//start lift contol --------------l

void lowerScoopSetUp(ControlP5 cp){
  lower = cp.addButton("lower")              //lower the scoop
    .setPosition(500, 210)
    .setSize(120, 70)
    .setSwitch(true);
  }
void raiseScoopSetUp(ControlP5 cp){   
  raise = cp.addButton("lift")              //raise the scoop
    .setPosition(500, 130)
    .setSize(120, 70)
    .setSwitch(true);
  }
//end lift contol ----------------l
//start speed control ------------s
void zero(ControlP5 cp){
  zero = cp.addButton("0")                 // movement speed will be set to zero%          
   .setPosition(190, 130)                
   .setSize(120, 70)
   .setSwitch(true);
}
void twentyFive(ControlP5 cp){
  twtyfive = cp.addButton("25")          // movement speed will be set to 25%
   .setPosition(450, 50)                
   .setSize(50, 50)
   .setSwitch(true);
}
void fifty(ControlP5 cp){
  ffty = cp.addButton("50")                // movement speed will be set to 50%
   .setPosition(510, 50)                
   .setSize(50, 50)
   .setSwitch(true);
   
}
void seventyFive(ControlP5 cp){
  svnfive = cp.addButton("75")         // movement speed will be set 75%
   .setPosition(570, 50)                
   .setSize(50, 50)
   .setSwitch(true);
}
void hundred(ControlP5 cp){  
  hundred = cp.addButton("100")              // movement speed will be set 100%
   .setPosition(630, 50)                
   .setSize(50, 50)
   .setSwitch(true);
}
//end speed control --------------s




//end methods for making buttons ------------------------------------------------------>

// start controls to switch button on and off -----------------------------------------+
void setOn(Button button){ //switch button on
  button.setOn();
}

void setOff(Button button){ // switch button off
  button.setOff();
}
// end controls to switch button on and off --------------------------------------------+


void batteryCapsole(float x, float y){
  fill(255, 0, 0);
  rect(x, y, 10, 20);
}

void greenBatteryCapsole(float x, float y){
  fill(0, 255, 0);
  rect(x, y, 10, 20);
}

void redBatteryCapsole(float x, float y){
  fill(255, 0, 0);
  rect(x, y, 10, 20);
}


void setup(){ //setup function

  size(700,300); //window size that we will use width,height

  cp5 = new ControlP5(this); //create a new instance of class ConrtolP5
  port = new Serial(this, "COM4", 9600); //connect arduino to HC-06

  forwardSetUp(cp5);
  backwardSetUp(cp5); //draw movement
  rightSetUp(cp5);
  leftSetUp(cp5);
  
  raiseScoopSetUp(cp5); //draw scoop movement
  lowerScoopSetUp(cp5);
  
  zero(cp5);   //draw speed
  twentyFive(cp5);
  fifty(cp5);
  seventyFive(cp5);
  hundred(cp5);
  
  zero.setOn();   //set two buttons to on
  twtyfive.setOn();
 
  background(211,211,211); //creates a dark grey background for the control panel
  text("battery", 620, 10);
  batteryCapsole(650, 10);
  batteryCapsole(640, 10);
  batteryCapsole(630, 10);
  batteryCapsole(620, 10);

  
}




void draw() {
  


  //battery level reading
  
    //port.read();
    //if(){  //25%
      greenBatteryCapsole(650,10);
    //}
    
  
  
  
  //if(forward.isOn()){
  //  println("forward");
  //}
}


//start key checking ---------------------------------------k
void keyPressed() {  //check which key is pressed and do something when it is
 try{

  Button speed = null;
  char speedInput = 'n';
  
  if(twtyfive.isOn()){  //check which speed value is currently active
    speed = twtyfive;
    speedInput = 'x';
  }
  else if(ffty.isOn()){
    speed = ffty;
    speedInput = 'c';
  }
  else if(svnfive.isOn()){
    speed = svnfive;
    speedInput = 'v';
  }
  else if(hundred.isOn()){
    speed = hundred;
    speedInput = 'b';
  }
  else{
  //System.out.println("error in speed input");
  }
  
  
  
  if(!forward.isOn() && !backward.isOn() && !right.isOn() && !left.isOn()){  //check to make sure no other button is pressed
  
    switch(key){
      case 'w':
        setOff(zero);         //foward
        setOn(forward);
        port.write('f');
        port.write(speedInput);
        break;
      case 'a':
        setOff(zero);
        setOn(left);
        port.write('l');
        port.write(speedInput);
        break;
      case 's':            //backwards
        setOff(zero);
        setOn(backward);
        port.write('p');
        port.write(speedInput);
        break;
      case 'd':
        setOff(zero);
        setOn(right);
        port.write('r');
        port.write(speedInput);
        break;
      case 'r':
        setOn(raise);
        port.write('u');
        break;
      case 't':
        setOn(lower);
        port.write('d');
        break;
      case 'v':               //25
        setOff(speed);
        setOn(twtyfive);
        port.write('x');
        break;
      case 'b':              //50
        setOff(speed);
        setOn(ffty);
        port.write('c');
        break;
      case 'n':                 //75
        setOff(speed);
        setOn(svnfive);
        port.write('v');
        break;
      case 'm':               //100
        setOff(speed);
        setOn(hundred);
        port.write('b');
        break;
      default:
        println("not valid input");
      }
  }
  
 }catch(Exception e){}
  
}

void keyReleased() { // do something when the key is released

  switch(key){ // check which key is pressed and turn on and off buttons and send port stuff
  case 'w':
    setOff(forward);
    setOn(zero);
    port.write('s');
    break;
  case 'a':
    setOff(left);
    setOn(zero);
    port.write('s');
    break;
  case 's':
    setOff(backward);
    setOn(zero);
    port.write('s');
    break;
  case 'd':
    setOff(right);
    setOn(zero);
    port.write('s');
    break;
  case 'r':
    setOff(raise);
    break;
  case 't':
    setOff(lower);
    break;
 
  case 'v': //nothing happens when releasing speed controls
    break;
  case 'b': // speed control
    break;
  case 'n': // speed control
    break;
  case 'm': // speed control
    break;
  default:
    println("not valid input");
  }

}


//end key checking ---------------------------------------k
