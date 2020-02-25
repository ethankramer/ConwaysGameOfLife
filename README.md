# ConwaysGameOfLife

Conway's Game of Life is a cellular automaton program, which is displayed as a grid of cells. 
Each cell is either "alive" or dead" depending on the "neighbor" cells. Each cell has 8 neighbors:
3 on top, left, right, and 3 on bottom. The rules of the game are as follows:

  - If a cell has less than 2 "alive" neighbors, the cell is dead/"dies"
    - Represents underpopulation
  - If a cell is dead, but has 3 alive neighbprs, it is "revived"/alive
    - Represents reproduction
  - If a cell has more than 3 alive neighbors, the cell is dead/"dies"
    - Represents overpopulation
  - If a cell is alive, and has either 2 or 3 alive neighbors, it lives on to the next generation
  
  Each "generation" will check each cell and its neighbors, and update the alive/dead status of a cell
  if the conditions of a rule are met. The grid of cells is re-drawn and the next generation begins.
  
  For this program, the grid "wraps" around from left to right (and vice versa), and top to bottom (and vice versa).
  This prevents the grid being infinitely big, and forces the game to eventually reach an equilibrium.
  
  The game begins by randomly assigning half of the cells alive, thus allowing the game to begin (if all cells began as
  alive or dead, the game would end instantly).
  
  One modification I added to the graphics is a cell gradually turns from black to red the longer it is alive. For example, 
  the first few generations will have mostly black cells, but the final generations will be mostly red cells, because the 
  game is close to equilibrium, so very few cells are changing states.
  
  Included are 4 images from one randomly generated grid.
  
    - gameOfLife(1) shows the inital condition/state of the grid. Half of the cells are alive.
    - gameOfLife(2) and (3) shows some middle generations, some cells are beginning to turn red.
    - gameOfLife(4) is the equilibrium of the game, most of the cells are red.
    
