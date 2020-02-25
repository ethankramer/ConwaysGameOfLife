# ConwaysGameOfLife

Conway's Game of Life is a cellular automaton program, which is displayed as a grid of cells. 
Each cell is either "alive" or dead" depending on the "neighbor" cells. Each cell has 8 neighbors:
3 on top, left, right, and 3 on bottom. The rules of the game are as follows:

  - If a cell has less than 2 "alive" neighbors, the cell is dead/"dies"
    - Represents underpopulation
  - If a cell is dead, but has 3 alive neighbprs, it is "revived"/alive
    - Represents reproduction
  - If a cell has more than 3 alive neighbors, the cell is dead/"dies
    - Represents overpopulation
