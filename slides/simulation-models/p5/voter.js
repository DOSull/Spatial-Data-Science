
var w;
var columns;
var rows;
var board;

function setup() {
  createCanvas(584, 584);
  w = 8;
  // Calculate columns and rows
  columns = floor(width/w);
  rows = floor(height/w);
  // Wacky way to make a 2D array is JS
  board = new Array(columns);
  for (var i = 0; i < columns; i++) {
    board[i] = new Array(rows);
  }
  // Going to use multiple 2D arrays and swap them
  next = new Array(columns);
  for (i = 0; i < columns; i++) {
    next[i] = new Array(rows);
  }
  init();
}

function draw() {
	background(128);
	generate();
	for (var i = 0; i < columns; i++) {
		for (var j = 0; j < rows; j++) {
			if (board[i][j] == 0) fill(255,0,0);
			else if (board[i][j] == 1) fill(0,153,0);
			else if (board[i][j] == 2) fill(0,0,255);
			else fill(255,255,0);
			strokeWeight(0);
			rect(i*w, j*w, w-1, w-1);
		}
	}
}

// reset board when mouse is pressed
function mousePressed() {
  init();
}

// Fill board randomly
function init() {
  for (var i = 0; i < columns; i++) {
    for (var j = 0; j < rows; j++) {
	   board[i][j] = floor(random(4));
    }
  }
}

function bounded(v, minV, maxV) {
	if (v > maxV) return 0;
	else if (v < minV) return maxV;
	else return v;
}

// The process of creating the new generation
function generate() {
	for (var i = 0; i < rows * columns; i++) {
		// Loop through every spot in our 2D array and check spots neighbors
		x = floor(random(columns));
		y = floor(random(rows));
		// pick a random orthogonal neighbor and set state to match
		var n = floor(random(4));
		if (n == 0) board[x][y] = board[x][bounded(y-1, 0, rows-1)];
		else if (n == 1) board[x][y] = board[x][bounded(y+1, 0, rows-1)];
		else if (n == 2) board[x][y] = board[bounded(x-1, 0, columns-1)][y];
		else board[x][y] = board[bounded(x+1, 0, columns-1)][y];

		if ((board[x][y] == 1)) fill(0);
		else fill(255);
		rect(x*w, y*w, w-1, w-1);
	}
}
