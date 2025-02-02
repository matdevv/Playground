-- Compiled with roblox-ts v3.0.0
local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local UserInputService = TS.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
--const keyPressEvent = ReplicatedStorage.WaitForChild("KeyPressEvent") as RemoteEvent;
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed == true then
		return nil
	end
	if input.KeyCode == Enum.KeyCode.E then
		print("pressed by the chairman!")
	end
end)
