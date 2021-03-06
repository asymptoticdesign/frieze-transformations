abstract class Frieze {
  float cell_height;
  float cell_width;
  float current_pos;
  int current_scale = 1;
  boolean rotate = false;

  Frieze(float cell_width, float cell_height) {
    this.cell_height = cell_height;
    this.cell_width = cell_width;
  }

  abstract void primitive();

  void hop() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    this.current_pos += this.cell_width;
    translate(this.current_pos, 0);
    primitive();
    popMatrix();
  }

  void step() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    this.current_pos += this.cell_width;
    this.current_scale *= -1;
    translate(this.current_pos, 0);
    scale(1, this.current_scale);
    primitive();
    popMatrix();
  }

  void jump() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    this.current_pos += this.cell_width;
    translate(this.current_pos, 0);
    primitive();
    scale(1, -1);
    primitive();
    popMatrix();
  }

  void sidle() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    this.current_pos += this.cell_width;
    translate(this.current_pos, 0);
    primitive();
    this.current_pos += this.cell_width;
    translate(this.cell_width, 0);
    scale(-1, 1);
    primitive();
    popMatrix();
  }

  void spin_hop() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    this.current_pos += this.cell_width;
    this.rotate = !this.rotate;
    //move over to next cell
    translate(this.current_pos, 0);
    if (this.rotate) {
      rotate(PI);
    }
    //draw primitive shape
    primitive();
    popMatrix();
  }

  void spin_jump() {
    pushMatrix();
    translate(this.cell_width/2, this.cell_height/2);
    this.current_pos += this.cell_width;
    this.rotate = !this.rotate;
    translate(this.current_pos, 0);
    if (this.rotate) {
      rotate(PI);
    }
    primitive();
    scale(1, -1);
    primitive();
    popMatrix();
  }

  void spin_sidle() {
    this.current_pos += this.cell_width;
    this.rotate = !this.rotate;
    pushMatrix();
    //translate to center of cell
    translate(this.cell_width/2, this.cell_height/2);
    translate(this.current_pos, 0);
    //rotate, draw cells
    if (this.rotate) {
      translate(this.cell_width, 0);
      rotate(PI);
    }  
    primitive();
    //draw mirror
    this.current_pos += this.cell_width;
    translate(this.cell_width, 0);
    scale(-1, 1);
    primitive();
    popMatrix();
  }
}
