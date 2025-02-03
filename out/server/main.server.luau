-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local _gameHandler = TS.import(script, game:GetService("ServerStorage"), "Handlers", "gameHandler")
local playerManager = _gameHandler.playerManager
local board = _gameHandler.board
local manager = playerManager.new()
local chessBoard = board.new()
Players.PlayerAdded:Connect(function(plr)
	manager:playerJoin(plr)
	plr.CharacterAdded:Connect(function(char)
		local copy = char:Clone()
		copy.Parent = game.Workspace
		copy.HumanoidRootPart.Anchored = true
		copy.HumanoidRootPart.Position = Vector3.new(0, 5, 0)
	end)
end)
chessBoard:createBoard()
-- print(makeHello("hey bro!"));
