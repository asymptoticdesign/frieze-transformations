//-----------------Globals
MyFrieze freeze = new MyFrieze(25.0, 50.0);
float ycounter = 0;
int num = 36;

//-----------------Setup
void setup() {
  size(1000, 600);
  background(0);
  stroke(255);
  noFill();
  smooth();
  strokeWeight(3);
  /*
  while(ycounter < height) {
    pushMatrix();
    translate(0,ycounter);
    for(int i = 0; i < 38; i++) {
      freeze.spin_sidle();
    }
    ycounter += freeze.cell_height;
    freeze.current_pos = 0;
    popMatrix();
  }
  */
  seven_friezes();
  saveFrame("seven_friezes.png");
}

//-----------------Defined Functions
void seven_friezes() {
  translate(0, 50);
  for (int i = 0; i < num; i++) {
    freeze.hop();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num; i++) {
    freeze.step();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num; i++) {
    freeze.jump();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num/2; i++) {
    freeze.sidle();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num; i++) {
    freeze.spin_hop();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num; i++) {
    freeze.spin_jump();
  }
  translate(0, 1.5*freeze.cell_height);
  freeze.current_pos = 0;
  for (int i = 0; i <= num/2; i++) {
    freeze.spin_sidle();
  }
}

//-------------------------Classes
//Frieze is an abstract class, so we need to implement our own subclass.

class MyFrieze extends Frieze {
  //implement a constructor that just calls the super class' constructor.
  MyFrieze(float cell_width, float cell_height) {
    super(cell_width, cell_height);
  }

  //define the previously abstract method primitive();
  void primitive() {
    /*This is the primitive cell and should be added by extending this class*/
    line(-this.cell_width/2, -this.cell_height/2, this.cell_width/2, this.cell_height/2);
    ellipse(-this.cell_width/2, -this.cell_height/2, this.cell_width/4, this.cell_height/4);
  }  
}

