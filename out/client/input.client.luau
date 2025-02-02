-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local UserInputService = _services.UserInputService
local ReplicatedStorage = _services.ReplicatedStorage
local keyPressEvent = ReplicatedStorage:WaitForChild("KeyPressEvent")
-- Function to detect key presses
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return nil
	end
	if input.KeyCode == Enum.KeyCode.E then
		print("E key pressed! Sending to server...")
		keyPressEvent:FireServer("E")
	end
end)
