import controlP5.*; //imports the ControlP5 library
import processing.serial.*; //import serial library


//start variable declaration ------------/

ControlP5 cp5; //create a ControlP5 object

Button forward;
Button right; 
Button left; 
Button backward; 

Button raise;
Button lower;

Button zero;
Button twtyfive;
Button ffty;
Button svnfive;
Button hundred;

//Serial port;
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
void setOn(Button button){
  button.setOn();
}

void setOff(Button button){
  button.setOff();
}
// end controls to switch button on and off --------------------------------------------+





void setup(){ //setup function

  size(700,300); //window size that we will use width,height

  cp5 = new ControlP5(this); //create a new instance of class ConrtolP5
  //port = new Serial(this, "COM4", 9600); //connect arduino to HC-06

  forwardSetUp(cp5);
  backwardSetUp(cp5);
  rightSetUp(cp5);
  leftSetUp(cp5);
  
  raiseScoopSetUp(cp5);
  lowerScoopSetUp(cp5);
  
  zero(cp5);
  twentyFive(cp5);
  fifty(cp5);
  seventyFive(cp5);
  hundred(cp5);
  
  zero.setOn();
  twtyfive.setOn();
  
  
}




void draw() {
  

  background(211,211,211); //creates a dark grey background for the control panel
  
  //if(forward.isOn()){
  //  println("forward");
  //}
}


//start key checking ---------------------------------------k
void keyPressed() {
 try{

  Button speed = null;
  char speedInput = 'n';
  
  if(twtyfive.isOn()){
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
        setOff(zero);
        setOn(forward);
        //port.write('f');
        //port.write(speedInput);
        break;
      case 'a':
        setOff(zero);
        setOn(left);
        //port.write('x');
        //port.write(speedInput);
        break;
      case 's':
        setOff(zero);
        setOn(backward);
        //port.write('r');
        //port.write(speedInput);
        break;
      case 'd':
        setOff(zero);
        setOn(right);
        //port.write('b');
        //port.write(speedInput);
        break;
      case 'r':
        setOn(raise);
        //port.write('u');
        break;
      case 't':
        setOn(lower);
        //port.write('d');
        break;
      case 'v':
        setOn(twtyfive);
        setOff(speed);
        break;
      case 'b':
        setOn(ffty);
        setOff(speed);
        break;
      case 'n':
        setOn(svnfive);
        setOff(speed);
        break;
      case 'm':
        setOn(hundred);
        setOff(speed);
        break;
      default:
        println("not valid input");
      }
  }
  
 }catch(Exception e){}
  
}

void keyReleased() {

  switch(key){
  case 'w':
    setOff(forward);
    setOn(zero);
    //port.write('x');
    break;
  case 'a':
    setOff(left);
    setOn(zero);
    //port.write('x');
    break;
  case 's':
    setOff(backward);
    setOn(zero);
    //port.write('x');
    break;
  case 'd':
    setOff(right);
    setOn(zero);
    //port.write('x');
    break;
  case 'r':
    setOff(raise);
    //port.write('u');
    break;
  case 't':
    setOff(lower);
    //port.write('d');
    break;
  case 'v':
    break;
  case 'b':
    break;
  case 'n':
    break;
  case 'm':
    break;
  default:
    println("not valid input");
  }

}


//end key checking ---------------------------------------k
