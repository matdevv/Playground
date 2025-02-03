export abstract class ChessPiece {
	protected position: Vector2;
	protected color: "White" | "Black";

	constructor(position: Vector2, color: "White" | "Black") {
		this.position = position;
		this.color = color;
	}

	abstract getValidMoves(board: (ChessPiece | undefined)[][]): Vector2[];

	getPosition(): Vector2 {
		return this.position;
	}

	getColor(): "White" | "Black" {
		return this.color;
	}
}
