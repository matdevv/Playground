import { ChessPiece } from "./chessPiece";

export class Board {
	private BOARD_SIZE = 8;
	private TILE_SIZE = 2;
	private START_X = 0;
	private START_Z = 0;

	private grid: (ChessPiece | undefined)[][] = [];

	constructor() {
		this.initializeBoard();
		this.createPhysicalBoard();
	}

	/** Initializes logical chessboard */
	private initializeBoard() {
		// 1-based indexing (rows & columns from 1 to 8)
		for (let row = 1; row <= 8; row++) {
			this.grid[row] = [];
			for (let col = 1; col <= 8; col++) {
				this.grid[row][col] = undefined; // Empty square
			}
		}

		// Place major pieces
		this.grid[1][1] = new Rook(new Vector2(1, 1), "White");
		this.grid[1][2] = new Knight(new Vector2(1, 2), "White");
		this.grid[1][3] = new Bishop(new Vector2(1, 3), "White");
		this.grid[1][4] = new Queen(new Vector2(1, 4), "White");
		this.grid[1][5] = new King(new Vector2(1, 5), "White");
		this.grid[1][6] = new Bishop(new Vector2(1, 6), "White");
		this.grid[1][7] = new Knight(new Vector2(1, 7), "White");
		this.grid[1][8] = new Rook(new Vector2(1, 8), "White");

		// Place pawns
		for (let col = 1; col <= 8; col++) {
			this.grid[2][col] = new Pawn(new Vector2(2, col), "White");
			this.grid[7][col] = new Pawn(new Vector2(7, col), "Black");
		}

		// Place black pieces
		this.grid[8][1] = new Rook(new Vector2(8, 1), "Black");
		this.grid[8][2] = new Knight(new Vector2(8, 2), "Black");
		this.grid[8][3] = new Bishop(new Vector2(8, 3), "Black");
		this.grid[8][4] = new Queen(new Vector2(8, 4), "Black");
		this.grid[8][5] = new King(new Vector2(8, 5), "Black");
		this.grid[8][6] = new Bishop(new Vector2(8, 6), "Black");
		this.grid[8][7] = new Knight(new Vector2(8, 7), "Black");
		this.grid[8][8] = new Rook(new Vector2(8, 8), "Black");
	}

	/** Creates the physical chessboard in Workspace */
	private createPhysicalBoard() {
		const board = new Instance("Folder");
		board.Name = "ChessBoard";
		board.Parent = game.Workspace;

		for (let row = 1; row <= this.BOARD_SIZE; row++) {
			for (let col = 1; col <= this.BOARD_SIZE; col++) {
				const square = new Instance("Part");
				square.Size = new Vector3(this.TILE_SIZE, 0.5, this.TILE_SIZE);
				square.Position = new Vector3(
					this.START_X + (col - 1) * this.TILE_SIZE,
					0.3,
					this.START_Z + (row - 1) * this.TILE_SIZE,
				);
				square.Anchored = true;
				square.Material = Enum.Material.SmoothPlastic;
				square.Parent = board;

				// Name the part based on its grid location
				square.Name = `${row},${col}`;

				// Alternate colors (black & white)
				if ((row + col) % 2 === 0) {
					square.BrickColor = new BrickColor("White");
				} else {
					square.BrickColor = new BrickColor("Black");
				}
			}
		}

		print("Physical Chessboard Created!");
	}

	/** Gets a piece at a specific position */
	getPieceAt(position: Vector2): ChessPiece | undefined {
		return this.grid[position.X]?.[position.Y];
	}

	/** Moves a piece on the logical board */
	movePiece(from: Vector2, to: Vector2) {
		const piece = this.getPieceAt(from);
		if (!piece) return false; // No piece to move

		this.grid[to.X][to.Y] = piece; // Move piece
		this.grid[from.X][from.Y] = undefined; // Clear old position
		piece.position = to;

		return true;
	}
}
