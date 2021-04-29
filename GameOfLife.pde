
import de.bezier.guido.*;
//Declare and initialize constants NUM_ROWS and NUM_COLS = 20
public final int NUM_ROWS = 50;
public final int NUM_COLS = 50;
private Life[][] buttons; //2d array of Life buttons each representing one cell
private boolean[][] buffer; //2d array of booleans to store state of buttons array
private boolean running = true; //used to start and stop program
public boolean on = true;
int frame = 6;
public void setup () {
  size(400, 400);
  frameRate(frame);
  // make the manager
  Interactive.make( this );

  //your code to initialize buttons goes here
  
  buttons = new Life [NUM_ROWS][NUM_COLS];
  for (int r = 0; r < NUM_ROWS; r++)
  {
    for (int c = 0; c < NUM_COLS; c++)
    {
      buttons[r][c] = new Life (r, c);
    }
  }
  
  //your code to initialize buffer goes here
  
  buffer = new boolean [NUM_ROWS][NUM_COLS];
  for (int r = 0; r < buffer.length; r++)
  {
    for (int c = 0; c < buffer[0].length; c++)
    {
      buffer[r][c] = buttons[r][c].getLife();
    }
  }
  
}

public void draw () {
  background( 0 );
  if (running == false) //pause the program
    return;
  copyFromButtonsToBuffer();

  //use nested loops to draw the buttons here
  
  for (int row = 0; row < NUM_ROWS; row++) {
    for (int col = 0; col < NUM_COLS; col++) {
      square(row, col, 20);
    }
  }
  copyFromBufferToButtons();
}

public void keyPressed() {
  //your code here
  //slows down or speeds up program
  if (keyCode == DOWN) {
      frame--; 
    }
  if (keyCode == UP) {
      frame++; 
    }
  if (frame > 0){
     frameRate(frame);
   }
  if (key == ' ') {
      on = !on; 
    }
}

public void copyFromBufferToButtons() {
  //your code here
  for (int r = 0; r < buffer.length; r++)
  {
    for (int c = 0; c < buffer[0].length; c++)
    {
      buttons[r][c].setLife(buffer[r][c]);
    }
  }
}

public void copyFromButtonsToBuffer() {
  //your code here
  for (int r = 0; r < buffer.length; r++)
  {
    for (int c = 0; c < buffer[0].length; c++)
    {
      buffer[r][c] = buttons[r][c].getLife();
    }
  }
}

public boolean isValid(int r, int c) {
  //your code here
  if (r >= 0 && r < NUM_ROWS && c >= 0 && c < NUM_COLS)
    return true;
  else
    return false;
}

public int countNeighbors(int row, int col) {
  int neighbors = 0;
  //your code here
  for (int r = row-1; r <= row+1;  r++){
    for (int c = col-1; c <= col+1; c++){
      if (isValid(r, c)){
        if (buttons[r][c].getLife() == true){
          neighbors += 1;
        }
      }
    }
  }
  if (buttons[row][col].getLife()) {
    neighbors--;
  }
  return neighbors;
}

public class Life {
  private int myRow, myCol;
  private float x, y, width, height;
  private boolean alive;

  public Life (int row, int col) {
    // width = 400/NUM_COLS;
    // height = 400/NUM_ROWS;
    myRow = row;
    myCol = col; 
    x = myCol*width;
    y = myRow*height;
    alive = Math.random() < .5; // 50/50 chance cell will be alive
    Interactive.add( this ); // register it with the manager
  }

  // called by manager
  public void mousePressed () {
    alive = !alive; //turn cell on and off with mouse press
  }
  public void draw () {    
    fill(alive ? 200 : 100);
    rect(x, y, width, height);
  }
  public boolean getLife() {
    //replace the code one line below with your code
    return false;
  }
  public void setLife(boolean living) {
    //your code here
    alive = living;
  }
}
