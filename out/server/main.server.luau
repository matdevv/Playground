-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local Players = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local playerManager = TS.import(script, game:GetService("ServerStorage"), "Handlers", "gameHandler").playerManager
local manager = playerManager.new()
Players.PlayerAdded:Connect(function(plr)
	manager:playerJoin(plr)
	plr.CharacterAdded:Connect(function(char)
		local copy = char:Clone()
		copy.Parent = game.Workspace
		copy.HumanoidRootPart.Anchored = true
		copy.HumanoidRootPart.Position = Vector3.new(0, 5, 0)
	end)
end)
-- print(makeHello("hey bro!"));
