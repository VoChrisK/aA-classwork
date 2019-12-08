let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);

  for(let i = 0; i < 8; i++) {
    let row = new Array(8);
    grid[i] = row;
  }

  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if(!this.isValidPos(pos)) {
    throw new Error("Invalid Position!");
  } else if (!this.isOccupied(pos)) {
    return undefined;
  }

  let row = pos[0];
  let col = pos[1];
  return this.grid[row][col];
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if(this.validMoves(color).length > 0) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let row = pos[0];
  let col = pos[1];

  if(this.isOccupied(pos) && this.grid[row][col].color === color) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let row = pos[0];
  let col = pos[1];

  if(this.grid[row][col] !== undefined) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if(!this.hasMove("white") && !this.hasMove("black")) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let row = pos[0];
  let col = pos[1];
  
  if(row >= 0 && row < 8 && col >= 0 && col < 8) {
    return true;
  } else {
    return false;
  }
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
  let newPOS = new Array(2);
  newPOS[0] = pos[0] + dir[0];
  newPOS[1] = pos[1] + dir[1];

  if(!board.isValidPos(newPOS) || !board.isOccupied(newPOS)) {
    return null;
  }

  if (board.isMine(newPOS, color)) {
    if(piecesToFlip.length > 0) {
      return piecesToFlip;
    } else {
      return null;
    }
  }

  piecesToFlip.push(newPOS);
  return _positionsToFlip(board, newPOS, color, dir, piecesToFlip);
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if(this.validMove(pos, color)) {
    let row = pos[0];
    let col = pos[1];
    this.grid[row][col] = new Piece(color);
    this.flipPieces(pos, color);
  } else {
    throw new Error("Invalid Move!");
  }
};

Board.prototype.getPieces = function(pos, color) {
  let piecesToFlip = null;
  for (let i = 0; i < Board.DIRS.length; i++) {
    piecesToFlip = _positionsToFlip(this, pos, color, Board.DIRS[i], []);if(Array.isArray(piecesToFlip)) return piecesToFlip;
  }

  return piecesToFlip;
}

Board.prototype.flipPieces = function(pos, color) {
  let piecesToFlip = this.getPieces(pos, color);
  if(piecesToFlip === null) return;

  for(let i = 0; i < piecesToFlip.length; i++) {
    let row = piecesToFlip[i][0];
    let col = piecesToFlip[i][1];
    this.grid[row][col].flip();
  }
}

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  console.log("   0 1 2 3 4 5 6 7")
  console.log("  -----------------");
  for(let i = 0; i < this.grid.length; i++) {
    let row = `${i} |`;
    for(let j = 0; j < this.grid[i].length; j++) {
      if(this.grid[i][j] === undefined) {
        row += " |";
      } else {
        row += `${this.grid[i][j].toString()}|`;
      }
    }
    console.log(row);
  }
  console.log("  -----------------");
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if(this.isOccupied(pos)) return false;
  
  for(let i = 0; i < Board.DIRS.length; i++) {
    if(Array.isArray(_positionsToFlip(this, pos, color, Board.DIRS[i], []))) return true;
  }

  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validPos = [];
  for(let i = 0; i < this.grid.length; i++) {
    for(let j = 0; j < this.grid[i].length; j++) {
      if(this.validMove([i, j], color)) {
        validPos.push([i,j]);
      }
    }
  }

  return validPos;
};

module.exports = Board;
