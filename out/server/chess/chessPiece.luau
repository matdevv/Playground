-- Compiled with roblox-ts v3.0.0
local ChessPiece
do
	ChessPiece = {}
	function ChessPiece:constructor(position, color)
		self.position = position
		self.color = color
	end
	function ChessPiece:getPosition()
		return self.position
	end
	function ChessPiece:getColor()
		return self.color
	end
end
return {
	ChessPiece = ChessPiece,
}
