-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local _services = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local UserInputService = _services.UserInputService
local ReplicatedStorage = _services.ReplicatedStorage
local keyPressEvent = ReplicatedStorage:WaitForChild("KeyPressEvent")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed == true then
		return nil
	end
	if input.KeyCode == Enum.KeyCode.E then
		print("E key pressed! Sending to server...er")
		keyPressEvent:FireServer()
	end
end)
