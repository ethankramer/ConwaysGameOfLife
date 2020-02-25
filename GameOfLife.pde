
import java.util.*;
import java.lang.Math;

static int Size = 100;
static int cellSize = 5;

Life life = new Life();

void setup() 
{
  size(500, 500);
  frameRate(60);
}

void draw() { 
  background(255);
  life.updateGame();
} 

private static int N;
private static Random randomGenerator;
public class Cell {
  public boolean state;
  public int label;
  public int x;
  public int y;
  public int age;

  public Cell(Cell c){
    x = c.x;
    y=c.y;
    state = c.state;
    label = c.label;
    age = c.age;
  }

  public Cell(int posX, int posY) {
    //state: alive == true, dead == false
    //label: index = y*Size + x
    //initialize each cell as dead
    state = false;
    x = posX;
    y = posY;
    label = (y*Size)+x;
    age = 0;
  }
  
  public void death(){
   state = false;
   age = 0;
  }
  
  public void alive(){
    state = true;
    age++;
  }
}

public class Life {


  public void display() {
    for (int j=0; j<Size; j++) {
      for (int k=0; k<Size; k++) {
        Cell c = board[j][k];
        if (c.state) {
          fill(Math.min(255,c.age),0,0);
          rect(k*cellSize, j*cellSize, cellSize, cellSize);
        }
      }
    }
  }

  public void updateGame() {
    display();
     for (int j=0; j<Size; j++) {
      for (int k=0; k<Size; k++) {
        fBoard[j][k] = updateCell(board[j][k]);
      }
     }
     for (int j=0; j<Size; j++) {
      for (int k=0; k<Size; k++) {
        board[j][k] = fBoard[j][k];
      }
     }
  }

  public int checkCell(Cell c,int offsetX, int offsetY){
    int x = c.x+offsetX;
    if(x<0) x+= Size;
    x = x%Size;
    
    int y = c.y+offsetY;
    if(y<0) y+= Size;
    y = y%Size;
    
    if(board[y][x].state){
      return 1;
    }
      return 0;
  }

  public  Cell updateCell(Cell c) {
    Cell d = new Cell(c);
    int numAliveNeighbors;
    
    numAliveNeighbors = 
      checkCell(c,-1,-1)+
      checkCell(c,0,-1)+
      checkCell(c,1,-1)+
      checkCell(c,-1,0)+
      checkCell(c,1,0)+
      checkCell(c,-1,1)+
      checkCell(c,0,1)+
      checkCell(c,1,1);

    if (numAliveNeighbors<2) {
      d.death();
    } else if (numAliveNeighbors==3) {
      d.alive();
    } else if (numAliveNeighbors>3) {
      d.death();
    }
    else if(numAliveNeighbors==2&&c.state) { d.alive(); }
    else { d.death(); }
    return d;
  }

  public Cell[][] board;
  public Cell[][] fBoard;

  public Life() {
    int N = Size*Size;

    board = new Cell[Size][Size];
    fBoard = new Cell[Size][Size];


    for (int y=0; y<Size; y++) {
      for (int x=0; x<Size; x++) {
        board[y][x] = new Cell(x,y);
      }
    }

    randomGenerator = new Random();
    for (int i=0; i<N/2; i++) {
      int y = randomGenerator.nextInt(Size);
      int x = randomGenerator.nextInt(Size);

      board[y][x].state=true;
    }
  }
}
