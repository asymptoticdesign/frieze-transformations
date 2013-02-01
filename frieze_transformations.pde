//-----------------Globals
MyFrieze freeze = new MyFrieze(10.0, 20.0);
float ycounter = 0;
int num = 36;
int counter;
int selector;

//-----------------Setup
void setup() {
  size(1024, 768);
  background(0);
  stroke(255);
  noFill();
  smooth();
  deep_frieze();
}

void draw() {
}

void keyPressed() {
  if (key == 'c') {
    background(0);
  }
  if (key == ' ') {
    deep_frieze();
  }
}

//-----------------Defined Functions
void deep_frieze() {
  pushMatrix();
  translate(-freeze.cell_height/2, 0);
  while (ycounter < height) {
    pushMatrix();
    translate(0, ycounter);
    random_frieze();
    ycounter += freeze.cell_height;
    freeze.current_pos = 0;
    popMatrix();
  }
  ycounter = 0;
  popMatrix();
  saveFrame("deepfrieze-####.png");
}

void random_frieze() {
  while (counter < 40) {
    selector = int(random(7));
    switch(selector) {
    case 0:
      freeze.hop();
    case 1:
      freeze.step();
    case 2:
      freeze.jump();
    case 3:
      freeze.sidle();
    case 4:
      freeze.spin_hop();
    case 5:
      freeze.spin_jump();
    case 6:
      freeze.spin_sidle();
    }
    counter++;
  }
  counter = 0;
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

