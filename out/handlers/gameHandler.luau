-- Compiled with roblox-ts v3.0.0
local playerManager
do
	playerManager = setmetatable({}, {
		__tostring = function()
			return "playerManager"
		end,
	})
	playerManager.__index = playerManager
	function playerManager.new(...)
		local self = setmetatable({}, playerManager)
		return self:constructor(...) or self
	end
	function playerManager:constructor()
		self.data = {}
	end
	function playerManager:playerJoin(plr)
		print(`{plr.Name} has joined!`)
		local _data = self.data
		local _plr = plr
		local _arg1 = {
			name = plr.Name,
			id = plr.UserId,
			time = 0,
		}
		_data[_plr] = _arg1
	end
end
local board
do
	board = setmetatable({}, {
		__tostring = function()
			return "board"
		end,
	})
	board.__index = board
	function board.new(...)
		local self = setmetatable({}, board)
		return self:constructor(...) or self
	end
	function board:constructor()
		self.BOARD_SIZE = 8
		self.TILE_SIZE = 2
		self.START_X = 0
		self.START_Z = 0
	end
	function board:createBoard()
		local board = Instance.new("Folder")
		board.Name = "ChessBoard"
		board.Parent = game.Workspace
		do
			local row = 1
			local _shouldIncrement = false
			while true do
				if _shouldIncrement then
					row += 1
				else
					_shouldIncrement = true
				end
				if not (row <= self.BOARD_SIZE) then
					break
				end
				do
					local col = 1
					local _shouldIncrement_1 = false
					while true do
						if _shouldIncrement_1 then
							col += 1
						else
							_shouldIncrement_1 = true
						end
						if not (col <= self.BOARD_SIZE) then
							break
						end
						local square = Instance.new("Part")
						square.Size = Vector3.new(self.TILE_SIZE, 0.5, self.TILE_SIZE)
						square.Position = Vector3.new(self.START_X + (col - 1) * self.TILE_SIZE, 0.3, self.START_Z + (row - 1) * self.TILE_SIZE)
						square.Anchored = true
						square.Material = Enum.Material.SmoothPlastic
						square.Parent = board
						-- Name the part based on its grid location
						square.Name = `{row},{col}`
						-- Alternate colors (black & white)
						if (row + col) % 2 == 0 then
							square.BrickColor = BrickColor.new("White")
						else
							square.BrickColor = BrickColor.new("Black")
						end
					end
				end
			end
		end
		print("Board created!!")
	end
end
return {
	playerManager = playerManager,
	board = board,
}
