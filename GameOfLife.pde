
import java.util.*;
import java.lang.Math;

static int Size = 100;
//static int nCellsWidth = 100;
//static int nCellsHeight = 100;
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

  //h1.update(); 
  //h2.update();
} 

//private static int Size;
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
    // state: alive == true, dead == false
    // label: index = y*Size + x
    // initialize each cell as dead
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
        //Cell c = current[j*Size+k];
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
    //rect(0,0,10,10);
    //for (int i=0; i<current.length; i++) {
    //  Cell c = current[i];
    //  Cell mine = updateCell(c);
    //  future[i] = mine;
    //}

    //for (int i=0; i<current.length; i++) {
    //  current[i] = future[i];
    //}
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
    
    
    //if(c.x+offsetX<0 || c.y+offsetY<0||c.y+offsetY>=Size||c.x+offsetX>=Size){
    //  return 0;
    //}
    ////return board[c.y+offsetY][c.x+offsetX].state?1:0;
    //if(board[c.y+offsetY][c.x+offsetX].state){
    //  return 1;
    //}
    //  return 0;
  }

  public  Cell updateCell(Cell c) {
    //Cell d = new Cell(c.x, c.y);
    //d.state = c.state;
    //d.label = c.label;
    Cell d = new Cell(c);
    int numAliveNeighbors; //=0;
    
    numAliveNeighbors = 
      checkCell(c,-1,-1)+
      checkCell(c,0,-1)+
      checkCell(c,1,-1)+
      checkCell(c,-1,0)+
      checkCell(c,1,0)+
      checkCell(c,-1,1)+
      checkCell(c,0,1)+
      checkCell(c,1,1);

    //// Check all 8 neighbors, and update alive/dead state of current cell 'c'
    //Cell myNeighbor;

    ////check top-left neighbor
    //int topLeft = c.label-Size-1;
    //if (topLeft>=0) {
    //  myNeighbor = current[topLeft];
    //  if (myNeighbor.state) {
    //    numAliveNeighbors++;
    //  }
    //}

    //// check top neighbor
    //int top = c.label-Size;
    //if (top>=0) {
    //  myNeighbor = current[top];
    //  if (myNeighbor.state) {
    //    numAliveNeighbors++;
    //  }
    //}

    //// check top-right neighbor
    //int topRight = c.label-Size+1;
    //if (topRight>=0) {
    //  myNeighbor = current[topRight];
    //  if (myNeighbor.state) {
    //    numAliveNeighbors++;
    //  }
    //}

    //// check left neighbor
    //int left = c.label-1;
    //if (left>=0) {
    //  myNeighbor = current[left];
    //  if (myNeighbor.state) {
    //    numAliveNeighbors++;
    //  }
    //}

    //// check right neighbor
    //int right = c.label+1;
    //if (right<N) {
    //  myNeighbor = current[right];
    //  if (myNeighbor.state) {
    //    numAliveNeighbors++;
    //  }
    //}

    //// check bottom-left neighbor
    //int bottomLeft = c.label+Size-1;
    //if (bottomLeft<N) {
    //  myNeighbor = current[bottomLeft];
    //  if (myNeighbor.state) {
    //    numAliveNeighbors++;
    //  }
    //}

    //// check bottom neighbor
    //int bottom = c.label+Size;
    //if (bottom<N) {
    //  myNeighbor = current[bottom];
    //  if (myNeighbor.state) {
    //    numAliveNeighbors++;
    //  }
    //}

    //// check bottom-right neighbor
    //int bottomRight = c.label+Size+1;
    //if (bottomRight<N) {
    //  myNeighbor = current[bottomRight];
    //  if (myNeighbor.state) {
    //    numAliveNeighbors++;
    //  }
    //}

    //System.out.println("Cell "+c.label+" has "+numAliveNeighbors+" alive neighbors");
    if (numAliveNeighbors<2) {
      d.death();
    } else if (numAliveNeighbors==3) {
      //System.out.println("Update2");
      d.alive();
    } else if (numAliveNeighbors>3) {
      //System.out.println("Update3");
      d.death();
    }
    else if(numAliveNeighbors==2&&c.state) { d.alive(); }
    else { d.death(); }
    return d;
  }

  public Cell[][] board;
  public Cell[][] fBoard;
  //public  Cell[] current;
  //public  Cell[] future;

  public Life() {
    int N = Size*Size;
    //displayInitBoard();

    //board = new Cell[Size][Size];
    //current = new Cell[N];
    //future = new Cell[N];

    board = new Cell[Size][Size];
    fBoard = new Cell[Size][Size];


    for (int y=0; y<Size; y++) {
      for (int x=0; x<Size; x++) {
        //System.out.println("x is: "+x+" y is: "+y);
        //Cell c = new Cell(x, y);
        //System.out.println("label is:"+c.label);
        //board[y][x] = c;
        //current[y*Size+x] = c;
        board[y][x] = new Cell(x,y);
      }
    }

    randomGenerator = new Random();
    for (int i=0; i<N/2; i++) {
      int y = randomGenerator.nextInt(Size);
      int x = randomGenerator.nextInt(Size);

      //Cell c = current[rand];
      //c.state = true;
      //current[rand] = c;
     // current[rand].state = true;
       board[y][x].state=true;
    }
  }
}
